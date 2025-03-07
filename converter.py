import xmltodict
import json

# Caminho do arquivo de saída do Robot Framework
input_file = "results/output.xml"
output_file = "results/output.json"

# Converter XML para JSON
with open(input_file, "r") as xml_file:
    xml_content = xml_file.read()

json_content = json.dumps(xmltodict.parse(xml_content), indent=4)

# Salvar o JSON gerado
with open(output_file, "w") as json_file:
    json_file.write(json_content)

print(f"✅ JSON gerado com sucesso: {output_file}")
