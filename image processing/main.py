from fastapi import FastAPI, UploadFile

import final

app=FastAPI()
@app.post("/uploadfile/")
async def create_upload_file(myfile: UploadFile):
     img=myfile.file.read()
     response = final.checkupesite(img)
     if response:
          return {"Is a upesite"}
     else:
          return {"Not a upesite"}
