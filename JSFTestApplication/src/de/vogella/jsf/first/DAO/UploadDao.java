package de.vogella.jsf.first.DAO;

import java.util.ArrayList;
import java.util.List;

import de.vogella.jsf.first.model.KeyValuePairData;

public class UploadDao {
	
	public List<KeyValuePairData> retrieveDocCategoryList(){
		List<KeyValuePairData> docCategoryList = new ArrayList<KeyValuePairData>();
		KeyValuePairData data = new KeyValuePairData();
		data.setSequenceId(0);
		data.setEntityName("Category1");
		KeyValuePairData data1 = new KeyValuePairData();
		data1.setSequenceId(1);
		data1.setEntityName("Category2");
		KeyValuePairData data2 = new KeyValuePairData();
		data2.setSequenceId(2);
		data2.setEntityName("Category3");
		KeyValuePairData data3 = new KeyValuePairData();
		data3.setSequenceId(3);
		data3.setEntityName("Category4");
		docCategoryList.add(data);
		docCategoryList.add(data1);
		docCategoryList.add(data2);
		docCategoryList.add(data3);
		return docCategoryList;
	}
	
	public List<KeyValuePairData> retrieveDocClassificationList(){
		List<KeyValuePairData> docCategoryList = new ArrayList<KeyValuePairData>();
		KeyValuePairData data = new KeyValuePairData();
		data.setSequenceId(0);
		data.setEntityName("Classification1");
		KeyValuePairData data1 = new KeyValuePairData();
		data1.setSequenceId(1);
		data1.setEntityName("Classification2");
		KeyValuePairData data2 = new KeyValuePairData();
		data2.setSequenceId(2);
		data2.setEntityName("Classification3");
		KeyValuePairData data3 = new KeyValuePairData();
		data3.setSequenceId(3);
		data3.setEntityName("Classification4");
		docCategoryList.add(data);
		docCategoryList.add(data1);
		docCategoryList.add(data2);
		docCategoryList.add(data3);
		return docCategoryList;
	}

}
