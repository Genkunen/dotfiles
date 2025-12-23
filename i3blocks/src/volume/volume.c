#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void MapToColor(int value, size_t n, char (*output)[n]) {
    int min = 75;  
    int max = 230; 
    int range = max - min;

    int r = min;
    int g = min;
    int b = min; 

    if (value <= 22) {
        g = max;
        r = min + (value * range) / 22;
    } 
    else {
        r = max;
        g = max - ((value - 22) * range) / 23;
    }

    sprintf(*output, "#%02X%02X%02X", r, g, b);
}

int GetVolume(size_t n, char (*out)[n]) {
    FILE* file;
    file = popen("wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{if ($3 == \"[MUTED]\") print \"MUTE\"; else print int($2 * 100) \"%\"}'", "r");
    if (!file) {
        return 1;
    } 

    if (!fgets(*out, n, file)) {
        return 2;
    }
    pclose(file);

    return 0;
}

int main() {
    char volumeStr[5] = {0};
    long volume = 0;
    {
        char buffer[32] = {0};
        if(GetVolume(sizeof(buffer), &buffer) == 0) {
            strncpy(volumeStr, buffer, sizeof(volumeStr) - 1);
        } 
        else {
            buffer[31] = 0;
            printf("err %s", buffer);
            return 1;
        }
        volume = strtol(volumeStr, NULL, 10);
    }
    char output[32] = {0};
    size_t written = 0;
    {
        char* it = volumeStr;
        char* end = volumeStr + sizeof(volumeStr);
        while(it < end && *it++ != '%') {}
        size_t size = it - volumeStr;
        strncpy(output, volumeStr, size);
        strncpy(output + size, " [", 3);
        written = size + 2;
    }
    char color[8] = {0};
    {
        char* it = output + written; 
        long range = volume * 0.40;
        long count = range / 8;
        long fract = range % 8;
        const char* block = "█";
        while (count --> 0) {
            strcpy(it, block);
            it += strlen(block);
        }
        const char* append = "";
        switch (fract) {
            break;case 1: append = "▏";
            break;case 2: append = "▎";
            break;case 3: append = "▍";
            break;case 4: append = "▌";
            break;case 5: append = "▋";
            break;case 6: append = "▊";
            break;case 7: append = "▉";
            break;default:
            break;
        }
        strcpy(it, append);
        it += strlen(append);
        for (int i = 0; i < 5 - range / 8 - (fract != 0); ++i) {
            *it++ = '_';
        }
        *it = ']';
        MapToColor(range, 8, &color);
    }
    
    printf("%s\n", output);
    printf("%s\n", output);
    printf("%s\n", color);
    return 0;
}
