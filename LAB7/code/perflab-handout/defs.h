/*
 * driver.h - файл с используемыми определениями
 * 
 * НЕ ИЗМЕНЯЙТЕ ЭТОТ ФАЙЛ
 */
#ifndef _DEFS_H_
#define _DEFS_H_

#include <stdlib.h>

#define RIDX(i,j,n) ((i)*(n)+(j))

typedef struct {
   unsigned short red;
   unsigned short green;
   unsigned short blue;
} pixel;

typedef void (*lab_test_func) (int, pixel*, pixel*);

void smooth(int, pixel *, pixel *);
void rotate(int, pixel *, pixel *);

void register_rotate_functions(void);
void register_smooth_functions(void);
void add_smooth_function(lab_test_func, char*);
void add_rotate_function(lab_test_func, char*);

#endif /* _DEFS_H_ */

