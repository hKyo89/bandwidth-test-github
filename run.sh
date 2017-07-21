#!/bin/bash

BASEDIR=$(dirname "$0")

outer=100
inner=150
PREFIX="Creating package"

echo -ne "$PREFIX 0%\033[0K\r"

for (( i = 1; i <= $outer; i++ )); do
  PKGDIR=$BASEDIR/pkg

  if [[ $i = 1 ]]; then 
    rm -rf $PKGDIR/$i
    mkdir -p $PKGDIR/$i

    for (( j = 1; j <= $inner; j++ )); do
      cp $BASEDIR/testfile $PKGDIR/$i/testfile-$j
    done
  else
    cp -rf $PKGDIR/1 $PKGDIR/$i 
  fi
        
  n=`echo "$i * 100 / $outer" | bc`
  echo -ne "$PREFIX $n%\033[0K\r"
done

echo "$PREFIX 100%"
