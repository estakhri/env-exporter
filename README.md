# .env Exporter

A simple Bash script that exports variables from a `.env` file into the current shell session.

## Features
- Ignores empty lines
- Ignores full-line comments
- Strips inline comments
- Validates `KEY=VALUE` format
- Logs exported variables

## Usage

```bash
chmod +x export_env.sh
./export_env.sh         # uses .env
./export_env.sh file.env
```

## Example

### .env
```
API_KEY=12345 # test
DEBUG=true
PORT=8080
```

### Output
```
Exported: API_KEY=12345
Exported: DEBUG=true
Exported: PORT=8080
```

## License
MIT License
