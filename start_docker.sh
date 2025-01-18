echo "Script is running"

#!/bin/bash
yarn --cwd webapp start &
python3 main.py
