net=$1
mkdir -p random
for i in `seq 1 100`
do
   python3 sir_random.py $net >> random/${net}_result
done
cat random/${net}_result |cut -f 0,5 -d " "| python3 calc_ave.py 

