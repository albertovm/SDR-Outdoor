#ifndef SDR_OUTDOOR_APPLE_H
#define SDR_OUTDOOR_APPLE_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

bool sdr_outdoor_apple_init(const char *data_dir);
char *sdr_outdoor_apple_command(const char *json);
void sdr_outdoor_apple_string_free(char *value);
uint32_t sdr_outdoor_apple_spectrum_rows(float *output, size_t output_len,
                                double *metadata, size_t metadata_len);
size_t sdr_outdoor_apple_audio(float *output, size_t output_len);

#endif
