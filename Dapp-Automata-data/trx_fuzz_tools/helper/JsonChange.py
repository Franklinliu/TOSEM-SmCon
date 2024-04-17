import json

def convert_json_bool(json_data):
    return json.loads(json_data.replace('true', 'True').replace('false', 'False'))


input_file_path = 'input.json'
output_file_path = 'output.json'

with open(input_file_path, 'r') as input_file:
    json_data = input_file.read()

converted_data = convert_json_bool(json_data)

with open(output_file_path, 'w') as output_file:
    json.dump(converted_data, output_file, indent=4)


input_json_string = '{"key1": true, "key2": false}'
converted_json_string = json.dumps(convert_json_bool(input_json_string), indent=4)

print(converted_json_string)
