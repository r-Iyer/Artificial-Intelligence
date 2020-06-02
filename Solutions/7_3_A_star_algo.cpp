#include <iostream>
#include<vector>
#include <bits/stdc++.h> 
using namespace std;
typedef pair< vector<vector<int>>,pair<int,int > >  elements;
typedef vector<elements>  a_star;
struct closed_list
{
	elements values;
	closed_list *parent;
};						  					  
closed_list* newnode(elements values,closed_list *parent)
{
	closed_list *node=new closed_list();
	node->values=values;
	node->parent=parent;
	return node;
}
void print2(vector<vector<int>> mat)
{
	for(int i=0;i<mat.size();i++)
	{
		for(int j=0;j<mat[i].size();j++)
			cout<<mat[i][j]<<" ";
		cout<<endl;
	}
	cout<<endl;
}
pair<int,int> find_loc_in_goal(int val,vector<vector<int>> goal)
{
	pair<int,int> loc;
	for(int i=0;i<goal.size();i++)
	{
		for(int j=0;j<goal[i].size();j++)
		{
			if(goal[i][j]==val)
			 {loc.first=i;loc.second=j;return loc;}
		}
	}
	return loc;
}
int manhattan(vector<vector<int>> mat,vector<vector<int>> goal)
{
	pair<int,int> loc;
	int res=0;
	for(int i=0;i<mat.size();i++)
	{
		for(int j=0;j<mat[i].size();j++)
		{
			 loc=find_loc_in_goal(mat[i][j],goal);
			 //cout<<mat[i][j]<<" "<<i<<" "<<j<<" "<<loc.first<<" "<<loc.second<<endl;
			 res=res+abs(loc.first-i)+abs(loc.second-j);
		}
	}
	return res;
}
int tile_mismatch(vector<vector<int>> mat,vector<vector<int>> goal)
{
	int res=0;
	for(int i=0;i<mat.size();i++)
	{
		for(int j=0;j<mat[i].size();j++)
		{
			if(mat[i][j]!=goal[i][j])
				res++;
		}
	}
	return res;
}
bool find_already_exists(vector<vector<int>> mat,a_star &already_checked)
{
	for(int i=0;i<already_checked.size();i++)
	{
		if(already_checked[i].first==mat)
			{return true;}
	}
	return false;
}
void get_child(int m1,int n1,int m2, int n2, vector<vector<int>> mat,vector<vector<int>> goal,int g_value,closed_list *ptr,vector<closed_list*> &node,a_star &already_checked,string distance_measure)
{
	int new_h_value;
	if(m2<0||n2<0||m2==mat.size()||n2==mat[0].size())
		return;
	vector<vector<int>> new_arr=mat;
	int temp=new_arr[m1][n1];
	new_arr[m1][n1]=new_arr[m2][n2];
	new_arr[m2][n2]=temp; 
	
	if(find_already_exists(new_arr,already_checked))
		return;
	if(distance_measure=="TILE MISMATCH")
		new_h_value=tile_mismatch(new_arr,goal);
	else
		new_h_value=manhattan(new_arr,goal);
	pair<int,int> new_val (g_value,new_h_value);
	already_checked.push_back(elements (new_arr,new_val));
	node.push_back(newnode(elements (new_arr,new_val),ptr));
}
void generate_children(vector<vector<int>> mat,vector<vector<int>> goal,int g_value,closed_list *ptr,vector<closed_list*> &node,a_star &already_checked,string distance_measure)
{
	int m,n,flag=0;
	for(m=0;m<mat.size();m++)
		{for(n=0;n<mat[m].size();n++)
			{if(mat[m][n]==0)
				{flag=1;break;}}
				if(flag)break;}	
	get_child(m,n,m,n-1,mat,goal,g_value,ptr,node,already_checked,distance_measure);
	get_child(m,n,m-1,n,mat,goal,g_value,ptr,node,already_checked,distance_measure);
	get_child(m,n,m,n+1,mat,goal,g_value,ptr,node,already_checked,distance_measure);
	get_child(m,n,m+1,n,mat,goal,g_value,ptr,node,already_checked,distance_measure);
}
closed_list *find_min(vector<closed_list*> &node)
{
	int min=INT_MAX,h_value,f_value,g_value,min_h_value=INT_MAX;
	closed_list *ptr=NULL;
	for(int i=0;i<node.size();i++)
	{
		h_value=(node[i]->values).second.second;
		g_value=(node[i]->values).second.first;
		f_value=g_value+h_value;
		if(min==f_value&&min_h_value>h_value)
		{ptr=node[i];min=f_value;min_h_value=h_value;
		}
		if(min>f_value)
		{ptr=node[i];min=f_value;min_h_value=h_value;}
	}
	return ptr;
}
bool isgoal(vector<vector<int>> mat,vector<vector<int>> goal)
{
	for(int i=0;i<mat.size();i++)
		for(int j=0;j<mat[i].size();j++)
			if(mat[i][j]!=goal[i][j])
				return false;
	return true;
}
void printpath(closed_list *ptr)
{
	if(ptr->parent!=NULL)
		printpath(ptr->parent);
	print2((ptr->values).first);
}
void get_a_star_result(vector<vector<int>> arr,vector<vector<int>> goal,string distance_measure)
{
	a_star already_checked;
	vector<closed_list*> node;	
	int i=0,g_value,h_value;
	closed_list *ptr;
	if(distance_measure=="TILE MISMATCH")
		h_value=tile_mismatch(arr,goal);
	else
		h_value=manhattan(arr,goal);

	pair<int,int> c (0,h_value);
	node.push_back(newnode(elements (arr,c),NULL));
	while(1)
	{
		i++;
		ptr=find_min(node);
		g_value=(ptr->values).second.first;
		
		//cout<<"SELECTED g_value: "<<(ptr->values).second.first<<endl;
		//cout<<"SELECTED h_value: "<<(ptr->values).second.second<<endl;
		//print2((ptr->values).first);
		//cout<<"END OF ITERATION: "<<i<<endl;
		//cout<<"__________________"<<endl;
		
		if(isgoal((ptr->values).first,goal))
			break;
		
		int new_g_value=((ptr->values).second.first)+1;	
		(ptr->values).second.first=500; //assigning high values
		(ptr->values).second.second=500;//assigning high values
		generate_children((ptr->values).first,goal,new_g_value,ptr,node,already_checked,distance_measure);
		

	}
	cout<<"_________ROUTE______"<<endl;
	printpath(ptr);
	cout<<"No. of levels checked : "<<g_value<<endl;
	cout<<"DISTANCE MEASURE USED: "<<distance_measure<<endl;
	cout<<"TOTAL ITERATIONS: "<<i<<endl;
}
int main()
{
	vector<vector<int>> goal {{1,2,3},
						  {4,0,5},
						  {6,7,8}};
	vector<vector<int>> start {{1,2,3},
						  {4,5,6},
						  {7,8,0}};
	get_a_star_result(start,goal,"TILE MISMATCH");
	get_a_star_result(start,goal,"MAHNHATTAN");
	//cout<<manhattan(arr,goal);
	return 0;
}
