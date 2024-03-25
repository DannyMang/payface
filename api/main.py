from fastapi import FastAPI

app = FastAPI()
counter = 0

@app.post("/")
def increment_counter():
    global counter
    counter += 1
    return {"counter": counter}


@app.get("/")
def get_counter():
    global counter
    return {"counter": counter}