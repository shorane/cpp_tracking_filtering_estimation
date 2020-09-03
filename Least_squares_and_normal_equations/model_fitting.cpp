#include<iostream>
#include<fstream>
#include<vector>
#include <Eigen/Dense>
#include<string>

using Eigen::MatrixXd;
using namespace std;

void print_vector(vector<vector<double> > v){
    vector<vector<double> >::iterator mvp;
    vector<double>::iterator vp;
    for(mvp= v.begin(); mvp!=v.end(); mvp++){
        for(vp = mvp->begin(); vp!= mvp->end(); vp++){
            cout<<*vp<<" ";
        }
        cout<<endl;
    }
}
void print_matrix_vector(vector<double> v){
    vector<double>::iterator it;
    for(it= v.begin(); it!= v.end(); it++){
        cout<<*it<<" ";
    }cout<<endl;
}

MatrixXd* read_matrix(string filename){
    ifstream myfile;
    myfile.open(filename);
    if (!myfile.is_open()) throw runtime_error("Could not open file");
    string row_item;
    vector<vector<double> > rows;    
    string line;
    while(myfile.good()){
        vector<double> row;
        getline(myfile, line);
        stringstream s(line);
        while (getline(s,row_item,',')){
            row.push_back(stod(row_item));
        }
        rows.push_back(row);
    }
    myfile.close();
    int nrows,ncols;
    nrows = rows.end() - rows.begin();
    ncols = rows[0].end() - rows[0].begin();
    MatrixXd* m = new MatrixXd(nrows,ncols);
    for(int i=0; i<nrows; i++){
        for (int j=0; j<ncols; j++){
            (*m)(i,j) = rows[i][j];
        }
    } 
    // cout<<"The following is a matrix of "<<nrows<<" rows and "<<ncols<<" coloumns: "<<endl<<*m<<endl;
    return m;
}

int main(){

    MatrixXd* data = read_matrix("83ppl.csv");
    // cout<<(*data).rows()<<" by "<<(*data).cols()<<endl;

    // Data arrangement:
    int Nsize = (*data).rows();
    MatrixXd x_data(Nsize, 1);
    MatrixXd y_data(Nsize, 1);
    x_data << (*data).col(3);
    y_data << (*data).col(2);
    x_data = x_data.array() / y_data.array();

    // Linear model:--------------------------------------------------------------------
    // int Msize = 2;
    // MatrixXd A(Nsize,Msize);
    // MatrixXd b(Nsize,1);

    // A << x_data, MatrixXd::Ones(Nsize,1);
    // b << y_data;

    // MatrixXd At = A.transpose();
    // MatrixXd X(Msize,1); 
    // X = (At*A).inverse() * At * b;

    // double m = X(0);
    // double c = X(1);
    // cout<<"slope m: "<<m<<endl<<"const c: "<<c<<endl;
    
    // Exp model--------------------------------------------------------------------

    // int Msize = 2;
    // MatrixXd A(Nsize,Msize);
    // MatrixXd b(Nsize,1);

    // A << x_data, MatrixXd::Ones(Nsize,1);
    // b << y_data.array().log();

    // MatrixXd At = A.transpose();
    // MatrixXd X(Msize,1); 
    // X = (At*A).inverse() * At * b;

    // long double a1 = exp(X(1)), b1 = X(0);
    // cout<<"Exp a: "<<  a1 <<"Exp b: "<< b1<<endl;

    // x-Exp model--------------------------------------------------------------------

    // int Msize = 2;
    // MatrixXd A(Nsize,Msize);
    // MatrixXd b(Nsize,1);

    // A << x_data.array().log() , MatrixXd::Ones(Nsize,1);
    // b << y_data.array().log();

    // MatrixXd At = A.transpose();
    // MatrixXd X(Msize,1); 
    // X = (At*A).inverse() * At * b;

    // long double a1 = exp(X(1)), b1 = X(0);
    // cout<<"x-Exp a: "<< a1  <<"x-Exp b: "<< b1 <<endl;

    // Loagrithmic model--------------------------------------------------------------------

    // int Msize = 2;
    // MatrixXd A(Nsize,Msize);
    // MatrixXd b(Nsize,1);

    // A << x_data.array().log() , MatrixXd::Ones(Nsize,1);
    // b << y_data;

    // MatrixXd At = A.transpose();
    // MatrixXd X(Msize,1); 
    // X = (At*A).inverse() * At * b;
    // long double b1 = X(0);
    // long double a1 = X(1);
    // cout<<"Log a: "<<  a1 <<"Log b: "<< a1 <<endl;

    // inv model--------------------------------------------------------------------

    int Msize = 1;
    MatrixXd A(Nsize,Msize);
    MatrixXd b(Nsize,1);

    A << MatrixXd::Ones(Nsize,1);
    b << y_data.array() * x_data.array();

    MatrixXd At = A.transpose();
    MatrixXd X(Msize,1); 
    X = (At*A).inverse() * At * b;
    long double a1 = X(0);
    cout<<"inv a: "<< a1 <<endl;

    return 0;
}