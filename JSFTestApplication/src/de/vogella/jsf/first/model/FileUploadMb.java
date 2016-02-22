package de.vogella.jsf.first.model;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.faces.model.SelectItem;

import org.richfaces.event.UploadEvent;
import org.richfaces.model.UploadItem;

import de.vogella.jsf.first.DAO.UploadDao;




public class FileUploadMb {
	 private double celsius; 
	  private double fahrenheit;
	  private boolean initial= true; 
	  
	    private List<File> files = new ArrayList<File>();
	    private int uploadsAvailable = 5;
	    private boolean autoUpload = false;
	    private boolean useFlash = false;
	    KeyValuePairData keyValuePairData = new KeyValuePairData();
	    private List<SelectItem> docCategoryLsit = new ArrayList<SelectItem>();
	    private List<SelectItem> docClassificationLsit = new ArrayList<SelectItem>();
	    
	    public KeyValuePairData getKeyValuePairData() {
			return keyValuePairData;
		}



		public void setKeyValuePairData(KeyValuePairData keyValuePairData) {
			this.keyValuePairData = keyValuePairData;
		}



		public List<SelectItem> getDocCategoryLsit() {
			return docCategoryLsit;
		}



		public void setDocCategoryLsit(List<SelectItem> docCategoryLsit) {
			this.docCategoryLsit = docCategoryLsit;
		}



		public List<SelectItem> getDocClassificationLsit() {
			return docClassificationLsit;
		}



		public void setDocClassificationLsit(
				List<SelectItem> docClassificationLsit) {
			this.docClassificationLsit = docClassificationLsit;
		}



		public void setFahrenheit(double fahrenheit) {
			this.fahrenheit = fahrenheit;
		}



		public void setInitial(boolean initial) {
			this.initial = initial;
		}



		public int getSize() {
	        if (getFiles().size()>0){
	            return getFiles().size();
	        }else 
	        {
	            return 0;
	        }
	    }

	    

	    public List<File> getFiles() {
			return files;
		}



		public void setFiles(List<File> files) {
			this.files = files;
		}



		public void paint(OutputStream stream, Object object) throws IOException {
	        stream.write(getFiles().get((Integer)object).getData());
	    }
	    public void listener(UploadEvent event) throws Exception{
	        UploadItem item = event.getUploadItem();
	       // File file = new File();
	        String fileName = item.getFileName();
	        System.out.println("filename is--->"+fileName);
	        fileName = fileName.substring(fileName.lastIndexOf('\\') + 1, fileName.length());
	        System.out.println("filename is--->"+fileName);
	        //file.setLength(item.getData().length);
	        //file.setName(item.getFileName());
	        //file.setData(item.getData());
	       // files.add(file);
	        File file = new File();
			FileInputStream fis = null;
			FileOutputStream out = null;
			String filepath = "C:/abc/";
			try {
				java.io.File uploadFile = new java.io.File(filepath, fileName);
				if (uploadFile.isFile())
					uploadFile.delete();// Delete file if already exist
				fis = new FileInputStream(item.getFile());
				out = new FileOutputStream(filepath + fileName);
				int bytes = 0;
				byte[] bteFile = new byte[(int) event.getUploadItem().getFile().length()];
				while ((bytes = fis.read(bteFile)) != -1) {

					out.write(bteFile, 0, bytes);
				}
				//file.setFilepoint(item.getFile());
				file.setLength(event.getUploadItem().getFile().length());
				file.setName(fileName);
				file.setData(bteFile);
				if (bteFile != null) {
					//LOG.info("Size of Binary obj: " + bteFile.length);
				}

				files.add(file);
				uploadsAvailable--;
				event.getUploadItems().clear();
				//added to get the document categories//
				UploadDao uploadDao = new UploadDao();
				List<KeyValuePairData> docCategoryLsitLocal = uploadDao.retrieveDocCategoryList();
				List<KeyValuePairData> docClassificationLsitLocal = uploadDao.retrieveDocClassificationList();
				for(KeyValuePairData data:docCategoryLsitLocal){
					SelectItem itemSelect = new SelectItem(data.getSequenceId(),data.getEntityName());
					docCategoryLsit.add(itemSelect);
				}
				for(KeyValuePairData data:docClassificationLsitLocal){
					SelectItem itemSelect = new SelectItem(data.getSequenceId(),data.getEntityName());
					docClassificationLsit.add(itemSelect);
				}
	        uploadsAvailable--;
			}catch(Exception e){
				e.printStackTrace();
			}
	    }  
	      
	    public String clearUploadData() {
	        files.clear();
	        setUploadsAvailable(5);
	        return null;
	    }
	    
	    public long getTimeStamp(){
	        return System.currentTimeMillis();
	    }
	    
/*	    public ArrayList<File> getFiles() {
	        return files;
	    }

	    public void setFiles(ArrayList<File> files) { 
	        this.files = files;
	    }*/

	    public int getUploadsAvailable() {
	        return uploadsAvailable;
	    }

	    public void setUploadsAvailable(int uploadsAvailable) {
	        this.uploadsAvailable = uploadsAvailable;
	    }

	    public boolean isAutoUpload() {
	        return autoUpload;
	    }

	    public void setAutoUpload(boolean autoUpload) {
	        this.autoUpload = autoUpload;
	    }

	    public boolean isUseFlash() {
	        return useFlash;
	    }

	    public void setUseFlash(boolean useFlash) {
	        this.useFlash = useFlash;
	    }

	  public double getCelsius() {
	    return celsius;
	  }
	  public void setCelsius(double celsius) {
	    this.celsius = celsius;
	  }
	  public double getFahrenheit() {
	    return fahrenheit;
	  }
	  
	  public boolean getInitial(){
	    return initial;
	  }
	  
	  public String reset (){
	    initial = true;
	    fahrenheit =0;
	    celsius = 0; 
	    return "reset";
	  }



	  public String celsiusToFahrenheit(){
		    initial = false; 
		    fahrenheit = (celsius *9 / 5) +32;
		    return "calculated";
		  }

}
