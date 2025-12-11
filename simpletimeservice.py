from http.server import BaseHTTPRequestHandler, HTTPServer
import json
from datetime import datetime

class SimpleTimeHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path != "/":
            self.send_error(404, "Not Found")
            return

        # Build response data
        response = {
            "timestamp": datetime.utcnow().isoformat() + "Z",
            "ip": self.client_address[0]
        }

        # Encode JSON
        response_bytes = json.dumps(response).encode("utf-8")

        # Send headers
        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(response_bytes)))
        self.end_headers()

        # Send body
        self.wfile.write(response_bytes)

def run(server_class=HTTPServer, handler_class=SimpleTimeHandler, port=8080):
    server = server_class(("0.0.0.0", port), handler_class)
    print(f"SimpleTimeService running on port {port}")
    server.serve_forever()

if __name__ == "__main__":
    run()
