while read F  ; do
        #echo $F
        export nome_bucket=$F
        echo $TT
        echo "Executando syn no bucket $F ..."
        #aws s3 cp teste.txt s3://appflask/teste/
done <buckets.txt
