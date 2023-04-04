#include <stdio.h>
#include <stdlib.h>

#include <osu.h>

char *get_by_line(FILE *fp) {
	char *line = NULL;
	return line;
}

int main(int argc, char **argv) {
	if (argc != 3) {
		printf("ERROR: Please provide a beatmap to compress, and an output name.\n");
		return 1;
	}

	// My library already does the optimisations
	Beatmap map = {0};
	of_beatmap_init(&map);
	
	FILE *fpi = fopen(*(argv + 1), "r");
	if (fpi == NULL) {
		printf("ERROR: File provided does not exsist, or cannot be read.\n");
		return 1;
	}

	of_beatmap_set(&map, fpi);
	fclose(fpi);

	char *temp = malloc((strlen(*(argv + 2)) + strlen(".temp") + 1) * sizeof(*temp));
	strcpy(temp, *(argv + 2));
	strcat(temp, ".temp");
	FILE *fpt = fopen(temp, "w");
	if (fpt == NULL) {
		printf("ERROR: Unable to write to temp file.\n");
		return 1;
	}

	of_beatmap_tofile(fpt, map);
	of_beatmap_free(map);
	fclose(fpt);

	fpt = fopen(temp, "r");
	if (fpt == NULL) {
		printf("ERROR: Unable to read newly created/temp file.\n");
		return 1;
	}

	// Editor is unnecessary
	FILE *fpo = fopen(*(argv + 2), "w");
	if (fpo == NULL) {
		printf("ERROR: Unable to write to file.\n");
		return 1;
	}

	char line[8192] = {0};
	while (fgets(line, sizeof(line), fpt)) {
		if (strncmp("[Editor]", line, 8) == 0) {
			while (fgets(line, sizeof(line), fpt)) {
				if (strcmp("\r\n", line) == 0 || *line == '\n') {
					break;
				}
			}
			continue;
		}

		fputs(line, fpo);
	}
	
	fclose(fpt);
	remove(temp);
	free(temp);
	fclose(fpo);

	return 0;
}
