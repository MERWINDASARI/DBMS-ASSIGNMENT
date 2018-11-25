%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	int yylex();
	int yyerror();
	FILE* yyin;
	struct node 
	{
		char str1[20];
		struct node* left;
		struct node* right;
		struct node* up;
		struct node* down;
	};
	typedef struct node node;
	typedef node* nodeptr;
	nodeptr databases=NULL;
	nodeptr currdb=NULL;
	nodeptr tables=NULL;
	void createdatabase(char* name)
	{
		nodeptr temp=(nodeptr) malloc(sizeof(node));
		strcpy(temp->str1,name);
		temp->down=NULL;
		temp->up=NULL;
		temp->right=databases;
		temp->left=NULL;
		if(databases!=NULL)
		databases->left = temp;
		databases=temp;		
	}
	void selectdb(char* name)
	{
		nodeptr temp=databases;
		while(temp!=NULL)
		{
			if(strcmp(temp->str1,name)==0)
				break;
			temp=temp->right;
		}	
		if(temp==NULL)
		{
			printf("enter a valid database name dumbo\n............\n OK. These are the valid database names\n");
			temp=databases;
			while(temp!=NULL)
			{
				printf("%s\n",temp->str1);
				temp=temp->right;
			}
			printf("don't make the mistake again\n");
			return;
		}		
		currdb=temp;
		tables=temp->down;
	}
	void createnewtable(char* name,nodeptr columnnames)
	{
		if(currdb==NULL)
		{
			printf("select a database first\n");
			return;
		}
		tables=currdb->down;
		nodeptr temp=(nodeptr) malloc(sizeof(node));
		strcpy(temp->str1,name);
		temp->down=NULL;
		temp->up=NULL;
		temp->right=tables;
		temp->left=NULL;
		if(tables!=NULL)
		tables->left = temp;
		tables=temp;
		temp->down=columnnames;
		currdb->down=tables;
	}
	nodeptr build_column(nodeptr n1,nodeptr n2)
	{
		nodeptr temp=n2;
		while(temp->right!=NULL)
		{
			temp=temp->right;
		}
		temp->right=n1;
		n1->left=temp;
		return n2;
	}
	nodeptr printtable(char* name)
	{
		nodeptr temp=tables,temp1,temp2;
		while(temp!=NULL)
		{
			if(strcmp(temp->str1,name)==0)
				break;
			temp=temp->right;		
		}
		if(temp==NULL)
		{
			printf("enter a valid table name dumbo\n............\n OK. These are the valid table names\n");
			temp=tables;
			while(temp!=NULL)
			{
				printf("%s\n",temp->str1);
				temp=temp->right;
			}
			printf("don't make the mistake again\n");
			return NULL;
		}
		printf("table name:%s\n\n",temp->str1);
		temp1=temp->down;
		nodeptr trail=(nodeptr) malloc(sizeof(node));trail->up=NULL;trail->down=NULL;trail->left=NULL;trail->right=NULL;
		strcpy(trail->str1,temp1->down->str1);
		while(temp1!=NULL)
		{
			temp2=temp1;
			while(temp2!=NULL)
			{
				printf("%s\t",temp2->str1 );
				temp2=temp2->right;
			}
			printf("\n");
			temp1=temp1->down;
		}
		printf("\n\n");
		return trail;
			
	}
	int insertinto(char* tablename, nodeptr columnnames, nodeptr values)
	{
		nodeptr values10=values;
		nodeptr temp=tables;
		while(temp!=NULL)
		{
			if(strcmp(temp->str1,tablename)==0)
				break;
			temp=temp->right;
		}
		if(temp==NULL)
		{
			printf("enter a valid table name dumbo\n............\n OK. These are the valid table names\n");
			temp=tables;
			while(temp!=NULL)
			{
				printf("%s\n",temp->str1);
				temp=temp->right;
			}
			printf("don't make the mistake again\n");
			return 0;
		}
		temp=temp->down;		// value iterator
		nodeptr temp1=temp; 	//column iterator
		while(temp->down!=NULL)
			temp=temp->down;
		nodeptr temp2=temp1;	//column name storing
		nodeptr temp3=temp;		// value name storing
		while(values!=NULL && columnnames!=NULL)
		{						
			while(strcmp(columnnames->str1,temp1->str1)!=0)
			{
				if(temp1==NULL)
				{	
					printf("no column name :%s\n",columnnames->str1);
					return 0;
				}
				nodeptr n=(nodeptr) malloc(sizeof(node));n->down=NULL;n->up=NULL;n->right=NULL;n->left=NULL;strcpy(n->str1,"null");
				nodeptr x=values->left;
				values->left=n;n->right=values;	
				if(x!=NULL)
				{
					x->right=n;n->left=x;			
				}
				temp1=temp1->right;
				temp=temp->right;
			}
			temp1=temp1->right;
			temp=temp->right;
			values=values->right;
			columnnames=columnnames->right;
		}
		if(columnnames!=NULL || values!=NULL)
		{
			printf("unequal number of values to columns\n");
			return 0;
		}
		values=values10;
		temp=temp3;
		while(temp!=NULL)
		{
			if(values->right==NULL && temp->right!=NULL)
			{
				nodeptr n=(nodeptr) malloc(sizeof(node));n->down=NULL;n->up=NULL;n->right=NULL;n->left=NULL;strcpy(n->str1,"_NULL_");
				n->left = values; values->right=n;
			}
			temp=temp->right;
			values=values->right;
		}
		while(values10->left!=NULL)
			values10=values10->left;
		while(temp3!=NULL)
		{
			temp3->down=values10;
			values10->up=temp3;
			values10=values10->right;
			temp3=temp3->right;
		}
		return 1;
	}
	nodeptr printcolumns(char* name,nodeptr temp)
	{
		nodeptr temp3=tables;
		while(temp3!=NULL)
		{
			if(strcmp(temp3->str1,name)==0)
				break;
			temp3=temp3->right;
		}
		if(temp3==NULL)
		{
			printf("enter a valid table name dumbo\n............\n OK. These are the valid table names\n");
			temp3=tables;
			while(temp3!=NULL)
			{
				printf("%s\n",temp3->str1);
				temp3=temp3->right;
			}
			printf("don't make the mistake again\n");
			return NULL;
		}		
		int i=0;
		nodeptr temp1=temp;
		while(temp1!=NULL)
		{
			temp1=temp1->right;
			i++;
		}
		nodeptr ar[i];
		temp1=temp;
		for(int j=0;j<i;j++)
		{
			ar[j]=temp1;
			temp1=temp1->right;
		}
		temp=temp3->down;
		for(int j=0;j<i;j++)
		{
			temp3=temp;
			while(temp3!=NULL)
			{
				if(strcmp(temp3->str1,ar[j]->str1)==0)
				{
					break;
				}
				temp3=temp3->right;
			}
			if(temp3==NULL)
			{
				printf("no column with the name: %s\n",ar[j]->str1);
				return NULL;
			}
			ar[j]=temp3;
		}
		nodeptr n=(nodeptr) malloc(sizeof(node));n->down=NULL;n->up=NULL;n->right=NULL;n->left=NULL;strcpy(n->str1,ar[0]->down->str1);
		while(ar[0]!=NULL)
		{
			for(int j=0;j<i;j++)
			{
				printf("%s\t",ar[j]->str1 );
				ar[j]=ar[j]->down;
			}
			printf("\n");
		}
		return n;
	}
	int strcmp2(char* a,char* b)
	{
		int k=strcmp(a,b);
		if(k==0)
			return 0;
		if(k>0)
			return 1;
		if(k<0)
			return 2;
	}
	nodeptr printtable2(char* name,char* first,int rel1,char* second)
	{
		nodeptr temp=tables;
		while(temp!=NULL)
		{
			if(strcmp(temp->str1,name)==0)
			{
				break;
			}
			temp=temp->right;
		}
		if(temp==NULL)
		{
			printf("enter a valid table name dumbo\n............\n OK. These are the valid table names\n");
			temp=tables;
			while(temp!=NULL)
			{
				printf("%s\n",temp->str1);
				temp=temp->right;
			}
			printf("don't make the mistake again\n");
			return NULL;
		}
		nodeptr n1=(nodeptr) malloc(sizeof(node));n1->down=NULL;n1->up=NULL;n1->right=NULL;n1->left=NULL;strcpy(n1->str1,first);		
		nodeptr n2=(nodeptr) malloc(sizeof(node));n2->down=NULL;n2->up=NULL;n2->right=NULL;n2->left=NULL;strcpy(n2->str1,second);
		nodeptr n=(nodeptr) malloc(sizeof(node));n->down=NULL;n->up=NULL;n->right=NULL;n->left=NULL;
		n1->down=n1;
		n2->down=n2;
		temp=temp->down;
		nodeptr temp2=temp;
		while(temp2!=NULL)
		{
			if(strcmp(n1->str1,temp2->str1)==0)
			{
				n1=temp2;
			}
			if(strcmp(n2->str1,temp2->str1)==0)
			{
				n2=temp2;
			}
			temp2=temp2->right;
		}
		temp2=temp;
		temp=temp->down;
		while(temp2!=NULL)
		{
			printf("%s\t",temp2->str1 );
			temp2=temp2->right;
		}
		printf("\n");
		n1=n1->down;n2=n2->down;
		if(temp==NULL)
			return NULL;
		while(temp!=NULL)
		{
			temp2=temp;
			if(strcmp2(n1->str1,n2->str1)==rel1)
			{
				while(temp2!=NULL)
				{
					strcpy(n->str1,temp2->str1);
					printf("%s\t",temp2->str1);
					temp2=temp2->right;
				}
				printf("\n");
			}
			n1=n1->down;
			n2=n2->down;
			temp=temp->down;
		}
		return n;
	}
	nodeptr printcolumns2(nodeptr columns3,char* name,char* first,int rel1,char* second)
	{
		nodeptr temp=tables;
		while(temp!=NULL)
		{
			if(strcmp(temp->str1,name)==0)
			{
				break;
			}
			temp=temp->right;
		}
		if(temp==NULL)
		{
			printf("enter a valid table name dumbo\n............\n OK. These are the valid table names\n");
			temp=tables;
			while(temp!=NULL)
			{
				printf("%s\n",temp->str1);
				temp=temp->right;
			}
			printf("don't make the mistake again\n");
			return NULL;
		}
		temp=temp->down;
		nodeptr n1=(nodeptr) malloc(sizeof(node));n1->down=NULL;n1->up=NULL;n1->right=NULL;n1->left=NULL;strcpy(n1->str1,first);		
		nodeptr n2=(nodeptr) malloc(sizeof(node));n2->down=NULL;n2->up=NULL;n2->right=NULL;n2->left=NULL;strcpy(n2->str1,second);
		nodeptr n=(nodeptr) malloc(sizeof(node));n->down=NULL;n->up=NULL;n->right=NULL;n->left=NULL;
		nodeptr temp2=temp;
		n1->down=n1;
		n2->down=n2;
		while(temp2!=NULL)
		{
			if(strcmp(n1->str1,temp2->str1)==0)
			{
				n1=temp2;
			}
			if(strcmp(n2->str1,temp2->str1)==0)
			{
				n2=temp2;
			}
			temp2=temp2->right;
		}
		int i=0;
		nodeptr temp1=columns3;
		while(temp1!=NULL)
		{
			temp1=temp1->right;
			i++;
		}
		nodeptr ar[i];
		temp1=columns3;
		for(int j=0;j<i;j++)
		{
			ar[j]=temp1;
			temp1=temp1->right;
		}	
		nodeptr temp3;
		for(int j=0;j<i;j++)
		{
			temp3=temp;
			while(temp3!=NULL)
			{
				if(strcmp(temp3->str1,ar[j]->str1)==0)
				{
					break;
				}
				temp3=temp3->right;
			}
			if(temp3==NULL)
			{
				printf("no column with the name: %s\n",ar[j]->str1);
				return NULL;
			}
			ar[j]=temp3;
		}
		for(int j=0;j<i;j++)
		{
			printf("%s\t",ar[j]->str1 );
			ar[j]=ar[j]->down;
		}
		printf("\n");
		if(ar[0]==NULL)
			return NULL;
		n1=n1->down;n2=n2->down;
		while(ar[0]!=NULL)
		{
			if(strcmp2(n1->str1,n2->str1)==rel1)
			{
				for(int j=0;j<i;j++)
				{
					printf("%s\t",ar[j]->str1 );
					strcpy(n->str1,ar[j]->str1);
					ar[j]=ar[j]->down;
				}
				printf("\n");
			}
			else
			{
				for(int j=0;j<i;j++)
				{
					ar[j]=ar[j]->down;
				}			
			}
			n1=n1->down;n2=n2->down;
		}
	}

%}
%union
{
	int relation;
	nodeptr k;
	char str2[20];
}
%token select1 from1 where1 create1 not1 sum1 use1 avg1 drop1 delete1 table1 comma semi quote star insert1 into1 values1 database1
%token <str2> text1
%type <k> columns selectstmt
%type <relation> rel


%%
G			: G S
			| S
			;

S			: createstmt semi
			| insertstmt semi
			| selectstmt semi
			;

createstmt	: create1 table1 text1 '(' columns ')' {createnewtable($3,$5);}
			| create1 database1 text1 {createdatabase($3);}
			;

columns		: columns comma text1	{$$=(nodeptr) malloc(sizeof(node));strcpy($$->str1,$3);$$->down=NULL;$$->up=NULL;$$->right=NULL;$$->left=NULL; $$=build_column($$,$1);}
			| text1					{$$=(nodeptr) malloc(sizeof(node)); strcpy($$->str1,$1);$$->down=NULL;$$->up=NULL;$$->right=NULL;$$->left=NULL;}
			;

insertstmt	: insert1 into1 text1 '(' columns ')' values1  '(' columns ')' {if(insertinto($3,$5,$9)){printf("insert successful\n");}else{printf("insert failed\n");}}

selectstmt	: select1 columns from1 text1 where1 text1 rel text1{$$=printcolumns2($2,$4,$6,$7,$8);}
			| select1 columns from1 text1	{$$=printcolumns($4,$2);}
			| select1 star from1 text1 where1 text1 rel text1{$$=printtable2($4,$6,$7,$8);}
			| select1 star from1 text1		{$$=printtable($4);}
			| use1 text1			{selectdb($2);}
			;

rel			: '='{$$=0;}
			| '>'{$$=1;}
			| '<'{$$=2;}
			;
%%

int main(int argc, char const *argv[])
{
	yyin=fopen(argv[1],"r");
	yyparse();
/*	nodeptr temp=tables,temp1,temp2;
	while(temp!=NULL)
	{
		printf("table name:%s\n\n",temp->str1);
		temp1=temp->down;
		temp=temp->right;
		while(temp1!=NULL)
		{
			temp2=temp1;
			while(temp2!=NULL)
			{
				printf("%s\t",temp2->str1 );
				temp2=temp2->right;
			}
			printf("\n");
			temp1=temp1->down;
		}
		printf("\n\n");
	}	*/
	return 0;
}		
int yyerror()
{
	printf("INVALID\n");
	return 0;
}