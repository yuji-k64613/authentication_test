BEGIN {
    status = 0;
}
{
   if (status == 0){ 
        if ($0 !~ /^#/){
            print $0
            status = 1;
        }
    }
    else {
        if ($0 ~ /^#/){
            status = 0
        }
    }
}
