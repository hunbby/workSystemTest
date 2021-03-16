package com.kimi.workstm.common.utils;

import java.util.ArrayList;
import java.util.List;

public class TreeVO {
    private String key;
    private String title;
    private String parent;
    private boolean isFolder = false;
    private List<Object> children = new ArrayList<Object>();
    private String select;
    
    
    
    public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

	public String getKey() {
        return key;
    }
    
    public void setKey(String key) {
        this.key = key;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getParent() {
        return parent;
    }
    
    public void setParent(String parent) {
        this.parent = parent;
    }
    
    public List<Object> getChildren() {
        return children;
    }
    
    public void setChildren(List<Object> children) {
        this.children = children;
    }
    
    public boolean getIsFolder() {
        return isFolder;
    }
    
    public void setIsFolder(boolean isFolder) {
        this.isFolder = isFolder;
    }
    
   
}