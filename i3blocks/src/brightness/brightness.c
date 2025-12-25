#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int GetVolume(size_t n, char (*out)[n]) {
    FILE* file;
    file = popen("brightnessctl --device='intel_backlight' get", "r");
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
    char brightnessStr[5] = {0};
    long brightness = 0;
    {
        char buffer[32] = {0};
        if(GetVolume(sizeof(buffer), &buffer) == 0) {
            strncpy(brightnessStr, buffer, sizeof(brightnessStr) - 1);
        } 
        else {
            buffer[31] = 0;
            printf("err %s", buffer);
            return 1;
        }
        brightness = strtol(brightnessStr, NULL, 10);
    }

    printf("%ld/400", brightness);

    return 0;
}
