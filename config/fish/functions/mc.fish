function mc
  command mkdir -p $argv
  if test $status = 0
    cd $argv
  end
end
