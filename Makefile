FC=mpif90 -O3 -fopenmp -fdefault-real-8 -fdefault-double-8  -fbounds-check
#FARGS=-g -fdefault-real-8 -fdefault-double-8  -fbounds-check
#FARGS=-O3 -fdefault-real-8 -fdefault-double-8 
#FC=ifort -mmic

%.o:%.F90
	$(FC) $(FARGS) -c -o $@ $<

all:modules.o maxwell.o particles_push.o current_deposition.o field_gathering.o mpi_derived_types.o boundary.o simple_io.o diags.o submain.o mpi_routines.o control_file.o  main.o

	$(FC) $(FARGS) -o a.out *.o
	
clean:
	rm -rf *.o *.mod a.out *.pxr
