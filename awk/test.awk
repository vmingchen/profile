#!/bin/gawk
@include file.awk

BEGIN {
	printf("m2hsize(1023, 0) = %s\n", m2hsize(1023, 0));
	printf("m2hsize(1024, 0) = %s\n", m2hsize(1024, 0));
	printf("m2hsize(1024*1025, 0) = %s\n", m2hsize(1024*1025, 0));
}
