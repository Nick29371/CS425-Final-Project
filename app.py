from flask import Flask, jsonify
import subprocess

app = Flask(__name__)

@app.route('/run-python', methods=['GET'])
def run_python_script():
    try:
        # Run the Python script
        result = subprocess.run(['python', 'test.py'], capture_output=True, text=True)
        if result.returncode == 0:
            return jsonify({"output": result.stdout}), 200
        else:
            return jsonify({"error": result.stderr}), 500
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, port=5000)
