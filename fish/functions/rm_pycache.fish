function rm_pycache -d "Remove __pycache__ files"
  find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
end
