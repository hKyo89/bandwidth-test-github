#!/bin/bash

BASEDIR=$(dirname "$0")

outer=500
inner=100
PREFIX="Creating package"
PKGDIR=$BASEDIR/pkg

echo -ne "$PREFIX 0%\033[0K\r"

for (( i = 1; i <= $outer; i++ )); do
  if [[ $i = 1 ]]; then 
    rm -rf $PKGDIR
    mkdir -p $PKGDIR/$i

    for (( j = 1; j <= $inner; j++ )); do
      cp $BASEDIR/testfile $PKGDIR/$i/testfile-$j
    done
  else
    mkdir -p $PKGDIR/$i
    cp -rf $PKGDIR/1/* $PKGDIR/$i/ 
  fi
        
  n=`echo "$i * 100 / $outer" | bc`
  echo -ne "$PREFIX $n%\033[0K\r"
done

echo "$PREFIX 100%"
