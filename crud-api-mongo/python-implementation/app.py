from crud import *

if __name__ == "__main__":
    app.run(port=int(os.getenv("PORT", 4000)), debug=True)
