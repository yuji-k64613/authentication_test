BEGIN {
    status = 0;
}
{
   if (status == 0){ 
        if ($0 ~ /^".*daemon/){
            status = 1;
        }
    }
    else {
        if ($0 ~ /^[^t ]*at *[a-z]/){
            match($0, /at *[^(]*/)
            line = substr($0, RSTART, RLENGTH)
            e = RLENGTH
            match(line, /at */)
            s = RLENGTH + 1
            line = substr(line, s, e)
            print line 
        }
        else {
            if ($0 ~ /^$/){
                print "#"
                status = 0
            }
        }
    }
}
