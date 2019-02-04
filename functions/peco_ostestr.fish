function peco_ostestr
    cat tags | peco | awk '{
        gsub(/\//,  ".", $2)
        gsub(/\.py/,  "", $2)
        if($NF == "c") {
            print $2 "." $1
            }
        else {
            gsub(/class:/,  "", $NF)
            print $2 "." $NF "." $1
        }
    }' | read -l test_path

    if test -n "$test_path"
        commandline -r "ostestr --no-discover $test_path"
    end
end

