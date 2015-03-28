#!/usr/bin/env python

from os import mkdir
from os import chmod
import stat

PATH="tmp"
NAME="Download.sh"

print ("Generate Download Script")
print ("="*30)

data=open("Url").readlines()

try:
    mkdir(PATH)
except FileExistsError:
    print("%s already"%PATH)

out=open(PATH+"/"+NAME,"w")



for b in data:
    a=b.strip()
    print ("Generate link: [[32m%15s[00m]"%a.split(";")[0])
    if (len(a.split(';')) == 3 ):
        (name,url,pat)=a.split(';')
        out.write("wget -cr '%s' --accept-regex '%s'\n"%(url,pat))
        out.write ("find -mindepth 2 -name '*.iso' -exec mv {} '%s.iso' \;\n"%(name))
    else:
        (name,url)=a.split(';')
        out.write ("wget -c '%s' -O %s.iso\n"%(url,name))


print("Go to '[32mcd %s[00m', and run '[32m./%s[00m' to downdload"%(PATH,NAME))
chmod(PATH+"/"+NAME,stat.S_IRWXU|stat.S_IRGRP|stat.S_IROTH)
