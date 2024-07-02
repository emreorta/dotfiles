function py_format 
    poetry run isort . && poetry run black .
end
