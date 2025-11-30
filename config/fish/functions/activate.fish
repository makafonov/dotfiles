function activate --description 'Create and activate a virtual environment'
  if test ! -d .venv
    python -m venv .venv
  end
  source .venv/bin/activate.fish
end
