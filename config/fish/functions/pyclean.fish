function pyclean
	fd -I -H '(__pycache__|\.(pytest_|mypy_)?cache|\.hypothesis\.py[cod]$)' | xargs rm -rf
end
