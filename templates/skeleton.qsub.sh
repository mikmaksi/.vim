#!/bin/bash
#PBS -q hotel
#PBS -N my_script
#PBS -l nodes=1:ppn=1
#PBS -l walltime=01:00:00
#PBS -o job.o
#PBS -e job.e 
#PBS -V
#PBS -M mikmaksi@gmail.com
#PBS -m abe
#PBS -t 1-10
#PBS -A gymreklab-group

# about: 

# cd into main analysis directory
cd /projects/ps-gymreklab/mikhail/

# activate R environment
source activate r

# for running locally
# PBS_ARRAYID=$1

# debug
# PBS_ARRAYID=1

# config
proc_list='_to_proc'

# get proc params
proc_params=`sed -n "${PBS_ARRAYID},${PBS_ARRAYID}p" $proc_list`
FS=' '; read -a proc_params <<< "$proc_params"
a=${proc_params[0]}
b=${proc_params[1]}
c=${proc_params[2]}
