#!/usr/bin/env python


print ("Generate Download Script")
print ("x"*30)

data=open("Url").readlines()
out=open("tmp/dd.sh","w")


for b in data:
    a=b.strip()
    if (len(a.split(';')) == 3 ):
        (name,url,pat)=a.split(';')
        print ("wget -cr '%s' --accept-regex '%s' "%(url,pat))
        out.write("wget -cr '%s' --accept-regex '%s'\n"%(url,pat))
        print ("find -mindepth 2 -name '*.iso' -exec mv {} '%s.iso' \;"%(name))
        out.write ("find -mindepth 2 -name '*.iso' -exec mv {} '%s.iso' \;\n"%(name))
    else:
        (name,url)=a.split(';')
        print ("wget -c '%s' -O %s.iso"%(url,name))
        out.write ("wget -c '%s' -O %s.iso\n"%(url,name))


