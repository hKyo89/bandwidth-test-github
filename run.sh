#!/bin/bash

BASEDIR=$(dirname "$0")

outer=5000
inner=2
PREFIX="Creating package"
PKGDIR=$BASEDIR/pkg

echo -ne "$PREFIX 0%\033[0K\r"

for (( i = 1; i <= $outer; i++ )); do
  if [[ $i = 1 ]]; then 
    rm -rf $PKGDIR

    for (( j = 1; j <= $inner; j++ )); do
      for (( k = 1; k <= $inner; k++ )); do
        for (( a = 1; a <= $inner; a++ )); do
          for (( b = 1; b <= $inner; b++ )); do
            mkdir -p $PKGDIR/$i/$j/$k/$a/$b
            for (( c = 1; c <= $inner; c++ )); do
              cp $BASEDIR/testfile $PKGDIR/$i/$j/$k/$a/$b/testfile-$c
            done
          done
        done
      done
    done
  else
    mkdir -p $PKGDIR/$i
    cp -rf $PKGDIR/1/* $PKGDIR/$i/ 
  fi
  
  n=`echo $i $outer | awk '{div=$1/$2; printf"%0.2f\n", div }'`
  # n=`echo "$i * 100 / $outer" | bc`
  echo -ne "$PREFIX $n%\033[0K\r"
done

echo "$PREFIX 100%"
