#!/bin/bash

# PARAMETROS ESPECIFICOS PARA CADA CLIENTE

date=`date +%Y.%m.%d.%H.%M`
numjobs="8"
iodepth="32"
resultfolder=result.$date
results=$resultfolder/results.jobs$numjobs.iodepth$iodepth.txt
mkdir $resultfolder

echo "###### TESTES DE LEITURA ######"
echo ""
sleep 5


# READ BS 4K
fio --time_based --size=1g --runtime=30 --ioengine=libaio \
--randrepeat=0 --direct=1 --invalidate=1 --verify=0 --verify_fatal=0 \
--ramp_time=10 --zero_buffers --bwavgtime=500 --iopsavgtime=500 --log_avg_msec=500 \
--group_reporting --name=pure-r-4k --rw=read --numjobs=$numjobs --iodepth=$iodepth \
--bs=4k --output=$resultfolder/pure-r-4k.txt

rm -f pure-*
sleep 5

# READ BS 16K
fio --time_based --size=1g --runtime=30 --ioengine=libaio \
--randrepeat=0 --direct=1 --invalidate=1 --verify=0 --verify_fatal=0 \
--ramp_time=10 --zero_buffers --bwavgtime=500 --iopsavgtime=500 --log_avg_msec=500 \
--group_reporting --name=pure-r-16k --rw=read --numjobs=$numjobs --iodepth=$iodepth \
--bs=16k --output=$resultfolder/pure-r-16k.txt

rm -f pure-*
sleep 5

# READ BS 32K
fio --time_based --size=1g --runtime=30 --ioengine=libaio \
--randrepeat=0 --direct=1 --invalidate=1 --verify=0 --verify_fatal=0 \
--ramp_time=10 --zero_buffers --bwavgtime=500 --iopsavgtime=500 --log_avg_msec=500 \
--group_reporting --name=pure-r-32k --rw=read --numjobs=$numjobs --iodepth=$iodepth \
--bs=32k --output=$resultfolder/pure-r-32k.txt

rm -f pure-*
sleep 5

# READ BS 64K
fio --time_based --size=1g --runtime=30 --ioengine=libaio \
--randrepeat=0 --direct=1 --invalidate=1 --verify=0 --verify_fatal=0 \
--ramp_time=10 --zero_buffers --bwavgtime=500 --iopsavgtime=500 --log_avg_msec=500 \
--group_reporting --name=pure-r-64k --rw=read --numjobs=$numjobs --iodepth=$iodepth \
--bs=64k --output=$resultfolder/pure-r-64k.txt

rm -f pure-*
sleep 5

# READ BS 512K
fio --time_based --size=1g --runtime=30 --ioengine=libaio \
--randrepeat=0 --direct=1 --invalidate=1 --verify=0 --verify_fatal=0 \
--ramp_time=10 --zero_buffers --bwavgtime=500 --iopsavgtime=500 --log_avg_msec=500 \
--group_reporting --name=pure-r-512k --rw=read --numjobs=$numjobs --iodepth=$iodepth \
--bs=512k --output=$resultfolder/pure-r-512k.txt

rm -f pure-*
sleep 5

# READ BS 1024K
fio --time_based --size=1g --runtime=30 --ioengine=libaio \
--randrepeat=0 --direct=1 --invalidate=1 --verify=0 --verify_fatal=0 \
--ramp_time=10 --zero_buffers --bwavgtime=500 --iopsavgtime=500 --log_avg_msec=500 \
--group_reporting --name=pure-r-1024k --rw=read --numjobs=$numjobs --iodepth=$iodepth \
--bs=1024k --output=$resultfolder/pure-r-1024k.txt

rm -f pure-*
sleep 5

echo ""
echo "###### TESTES DE GRAVACAO #####"
echo ""
sleep 5


# WRITE BS 4K
fio --time_based --size=1g --runtime=30 --ioengine=libaio \
--randrepeat=0 --direct=1 --invalidate=1 --verify=0 --verify_fatal=0 \
--ramp_time=10 --bs=4k --zero_buffers --numjobs=$numjobs --bwavgtime=1000 --iopsavgtime=1000 \
--log_avg_msec=1000 --group_reporting --name=pure-w-4k --rw=write --iodepth=$iodepth --output=$resultfolder/pure-w-4k.txt

rm -f pure-*
sleep 5

# WRITE BS 16K
fio --time_based --size=1g --runtime=30 --ioengine=libaio \
--randrepeat=0 --direct=1 --invalidate=1 --verify=0 --verify_fatal=0 \
--ramp_time=10 --bs=16k --zero_buffers --numjobs=$numjobs --bwavgtime=1000 --iopsavgtime=1000 \
--log_avg_msec=1000 --group_reporting --name=pure-w-16k --rw=write --iodepth=$iodepth --output=$resultfolder/pure-w-16k.txt

rm -f pure-*
sleep 5


# WRITE BS 32K
fio --time_based --size=1g --runtime=30 --ioengine=libaio \
--randrepeat=0 --direct=1 --invalidate=1 --verify=0 --verify_fatal=0 \
--ramp_time=10 --bs=32k --zero_buffers --numjobs=$numjobs --bwavgtime=1000 --iopsavgtime=1000 \
--log_avg_msec=1000 --group_reporting --name=pure-w-32k --rw=write --iodepth=$iodepth --output=$resultfolder/pure-w-32k.txt

rm -f pure-*
sleep 5

# WRITE BS 64K
fio --time_based --size=1g --runtime=30 --ioengine=libaio \
--randrepeat=0 --direct=1 --invalidate=1 --verify=0 --verify_fatal=0 \
--ramp_time=10 --bs=64k --zero_buffers --numjobs=$numjobs --bwavgtime=1000 --iopsavgtime=1000 \
--log_avg_msec=1000 --group_reporting --name=pure-w-64k --rw=write --iodepth=$iodepth --output=$resultfolder/pure-w-64k.txt

rm -f pure-*
sleep 5

# WRITE BS 512K
fio --time_based --size=1g --runtime=30 --ioengine=libaio \
--randrepeat=0 --direct=1 --invalidate=1 --verify=0 --verify_fatal=0 \
--ramp_time=10 --bs=512k --zero_buffers --numjobs=$numjobs --bwavgtime=1000 --iopsavgtime=1000 \
--log_avg_msec=1000 --group_reporting --name=pure-w-512k --rw=write --iodepth=$iodepth --output=$resultfolder/pure-w-512k.txt

rm -f pure-*
sleep 5

# WRITE BS 1024K
fio --time_based --size=1g --runtime=30 --ioengine=libaio \
--randrepeat=0 --direct=1 --invalidate=1 --verify=0 --verify_fatal=0 \
--ramp_time=10 --bs=1024k --zero_buffers --numjobs=$numjobs --bwavgtime=1000 --iopsavgtime=1000 \
--log_avg_msec=1000 --group_reporting --name=pure-w-1024k --rw=write --iodepth=$iodepth --output=$resultfolder/pure-w-1024k.txt

rm -f pure-*
sleep 5

echo ""
echo "###### TESTES DE GRAVACAO E LEITURA SIMULTANEA ######"
echo ""
sleep 5

# READWRITE BS 4K
fio --time_based --size=1g --runtime=30 --ioengine=libaio --randrepeat=0 \
--direct=1 --invalidate=1 --verify=0 --verify_fatal=0 --ramp_time=10 \
--zero_buffers --bwavgtime=500 --iopsavgtime=500 --log_avg_msec=500 \
--group_reporting --rw=randrw --rwmixread=60 --rwmixwrite=40 --name=pure-rw-4k \
--numjobs=$numjobs --stonewall --iodepth=$iodepth --bs=4k --output=$resultfolder/pure-rw-4k.txt

rm -f pure-*
sleep 5

# READWRITE BS 16K
fio --time_based --size=1g --runtime=30 --ioengine=libaio --randrepeat=0 \
--direct=1 --invalidate=1 --verify=0 --verify_fatal=0 --ramp_time=10 \
--zero_buffers --bwavgtime=500 --iopsavgtime=500 --log_avg_msec=500 \
--group_reporting --rw=randrw --rwmixread=60 --rwmixwrite=40 --name=pure-rw-16k \
--numjobs=$numjobs --stonewall --iodepth=$iodepth --bs=16k --output=$resultfolder/pure-rw-16k.txt

rm -f pure-*
sleep 5

# READWRITE BS 32K
fio --time_based --size=1g --runtime=30 --ioengine=libaio --randrepeat=0 \
--direct=1 --invalidate=1 --verify=0 --verify_fatal=0 --ramp_time=10 \
--zero_buffers --bwavgtime=500 --iopsavgtime=500 --log_avg_msec=500 \
--group_reporting --rw=randrw --rwmixread=60 --rwmixwrite=40 --name=pure-rw-32k \
--numjobs=$numjobs --stonewall --iodepth=$iodepth --bs=32k --output=$resultfolder/pure-rw-32k.txt

rm -f pure-*
sleep 5

# READWRITE BS 64K
fio --time_based --size=1g --runtime=30 --ioengine=libaio --randrepeat=0 \
--direct=1 --invalidate=1 --verify=0 --verify_fatal=0 --ramp_time=10 \
--zero_buffers --bwavgtime=500 --iopsavgtime=500 --log_avg_msec=500 \
--group_reporting --rw=randrw --rwmixread=60 --rwmixwrite=40 --name=pure-rw-64k \
--numjobs=$numjobs --stonewall --iodepth=$iodepth --bs=64k --output=$resultfolder/pure-rw-64k.txt

rm -f pure-*
sleep 5

# READWRITE BS 512K
fio --time_based --size=1g --runtime=30 --ioengine=libaio --randrepeat=0 \
--direct=1 --invalidate=1 --verify=0 --verify_fatal=0 --ramp_time=10 \
--zero_buffers --bwavgtime=500 --iopsavgtime=500 --log_avg_msec=500 \
--group_reporting --rw=randrw --rwmixread=60 --rwmixwrite=40 --name=pure-rw-512k \
--numjobs=$numjobs --stonewall --iodepth=$iodepth --bs=512k --output=$resultfolder/pure-rw-512k.txt

rm -f pure-*
sleep 5

# READWRITE BS 1024K
fio --time_based --size=1g --runtime=30 --ioengine=libaio --randrepeat=0 \
--direct=1 --invalidate=1 --verify=0 --verify_fatal=0 --ramp_time=10 \
--zero_buffers --bwavgtime=500 --iopsavgtime=500 --log_avg_msec=500 \
--group_reporting --rw=randrw --rwmixread=60 --rwmixwrite=40 --name=pure-rw-1024k \
--numjobs=$numjobs --stonewall --iodepth=$iodepth --bs=1024k --output=$resultfolder/pure-rw-1024k.txt

rm -f pure-*
sleep 5

echo ""

echo "########## DADOS ############" > $results
echo "" >> $results
echo "Hostname:`hostname`" >> $results
echo "Distribuicao: `cat /etc/*-release`" >> $results
echo lsb_release -a >> $results
echo "" >> $results
echo "###########################" >> $results
echo "" >> $results
lscpu | grep "Model name:" | cut -d: -f2 | sed -e 's/^[ \t]*//' >> $results
lscpu | grep "CPU(s):" | cut -d: -f2 | sed -e 's/^[ \t]*//' | head -1 >> $results
echo "" >> $results
echo "###########################" >> $results
echo "" >> $results
echo "### LEITURAS ###" >> $results
echo "" >> $results
echo "Read Block Size 4K" >> $results
cat $resultfolder/pure-r-4k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "Read Block Size 16K" >> $results
cat $resultfolder/pure-r-16k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "Read Block Size 32K" >> $results
cat $resultfolder/pure-r-32k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "Read Block Size 64K" >> $results
cat $resultfolder/pure-r-64k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "Read Block Size 512K" >> $results
cat $resultfolder/pure-r-512k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "Read Block Size 1024K" >> $results
cat $resultfolder/pure-r-1024k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "### GRAVACOES ###" >> $results
echo "" >> $results
echo "Write Block Size 4K" >> $results
cat $resultfolder/pure-w-4k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "Write Block Size 16K" >> $results
cat $resultfolder/pure-w-16k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "Write Block Size 32K" >> $results
cat $resultfolder/pure-w-32k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "Write Block Size 64K" >> $results
cat $resultfolder/pure-w-64k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "Write Block Size 512K" >> $results
cat $resultfolder/pure-w-512k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "Write Block Size 1024K" >> $results
cat $resultfolder/pure-w-1024k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "### LEITURAS E GRAVACOES SIMULTANEAS ###" >> $results
echo "" >> $results
echo "Read/Write Block Size 4K" >> $results
cat $resultfolder/pure-rw-4k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "Read/Write Block Size 16K" >> $results
cat $resultfolder/pure-rw-16k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "Read/Write Block Size 32K" >> $results
cat $resultfolder/pure-rw-32k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "Read/Write Block Size 64K" >> $results
cat $resultfolder/pure-rw-64k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "Read/Write Block Size 512K" >> $results
cat $resultfolder/pure-rw-512k.txt | grep "IOPS=" >> $results
echo "" >> $results
echo "Read/Write Block Size 1024K" >> $results
cat $resultfolder/pure-rw-1024k.txt | grep "IOPS=" >> $results
echo "" >> $results

echo ""
echo "##### RESULTADOS #####"
cat $results
