package com.wondersgroup.wszygl.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wondersgroup.wszygl.model.AreaModel;

/**
 * 
 * */
public class TreeUtil {

	private TreeUtil() {

	}

	public static TreeUtil getInstance() {
		return new TreeUtil();
	}

	
	 /**
	    * @return 存放父节点的list：fatherList
	    */
	public List<AreaModel> getFatherNode(List<AreaModel> treeNodeList) {
		int i, j, sum = 0;
		int size = treeNodeList.size();
		List<AreaModel> fatherList = new ArrayList<AreaModel>();
		for (i = 0; i < size; i++) {
			for (j = 0; j < size; j++) {
				if (!treeNodeList.get(i).getPid().equals(treeNodeList.get(j).getCode())) {
					sum++;
				} else {
					break;
				}
			}
			if (sum == size) {
				fatherList.add(treeNodeList.get(i));
				sum = 0;
			} else {
				sum = 0;
			}
		}
		return fatherList;
	}
	
	/**遍历fatherlist中的父节点
	* 调用maketree（）方法根据每个父节点产生相应的树
	* 并将产生的树放到list中
	* @param fatherlist
	* @return allTree（存放的都是树）
	*/
	public List<AreaModel> makeTreeList(List<AreaModel> fatherlist)
	{
	List<AreaModel> allTree =new ArrayList<AreaModel>();
	for(AreaModel item:fatherlist)
	{
		allTree.add(makeTree(item,fatherlist));
	}
	  return allTree;
	}
	
	/**根据传进来的树制作一颗树
	* 递归生成一棵树
	* @param Node
	* @return
	*/
	public AreaModel makeTree(AreaModel Node,List<AreaModel> treeNodeList)
	{
		AreaModel root = Node;
	    List<AreaModel> childrenTreeNode = getChildrenNodeById(Node.getCode(),treeNodeList);
	    for(AreaModel item:childrenTreeNode)
	    {
	    	AreaModel node = makeTree(item,treeNodeList);
	    	root.getChildren().add(node);
	    }
	   return root;
	}
	
	/**
	* @param nodeId（父节点对应的id）
	* @return 获得所有子节点，并存放在childrenTreeNode中
	*/
	public List<AreaModel> getChildrenNodeById(String nodeId,List<AreaModel> treeNodeList) {
	List<AreaModel> childrenTreeNode = new ArrayList<AreaModel>();
	for (AreaModel item : treeNodeList) {
		if (item.getPid().equals(nodeId)) {
		childrenTreeNode.add(item);
		}
		}
	return childrenTreeNode;
	}
	
	
	
	public List<AreaModel> toAreaTreeList(List<AreaModel> areas){
		 Map<Object,AreaModel> maps = new HashMap<>();
	      List<AreaModel> list = new ArrayList<>();
	      for (AreaModel module : areas) {
	         addTreeNode(module,maps,list);
	      }
	      return list;
	}
	
	private  void addTreeNode(AreaModel module, Map<Object, AreaModel> maps,
            List<AreaModel> list) {
		if(maps.containsKey(module.getCode())){
			maps.get(module.getCode()).setEntity(module);
		}else{
			maps.put(module.getCode(), module);
		}
		if(module.getPid() == null){
			list.add(maps.get(module.getCode()));
		}else{
			if(maps.containsKey(module.getPid())){
			  maps.get(module.getPid()).addChildren(module);
			}else{
				AreaModel parent = new AreaModel();
			  parent.addChildren(module);
			  maps.put(module.getPid(),parent);
			}
		}
	}

	
}
