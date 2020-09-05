#include<iostream>
#include <math.h>
#include<fstream>
#include<vector>
#include <Eigen/Dense>
#include<string>

#define	TOTAL_ITERATIONS	50000

using Eigen::MatrixXd;
using namespace std;

//helper function declaration:
MatrixXd* read_matrix(string filename);
void write_matrix(string filename, MatrixXd m);
void write_vec(string filename, vector<double> m);

//      MAIN PROGRAM
int main(){
    string casename = "A";
    // import the data required from A,B and C files

    MatrixXd* data = read_matrix("Data_"+ casename + "_lab_2.csv");

    double	an,an1,fan,fpan, xi, yi;
    int	i,j;

    an = 0.1;	// initial guess of a
    vector<double> v;
    v.push_back(an);
    for (j=0; j<TOTAL_ITERATIONS; j++){
        fan=fpan=0.0;
        for (i=0; i<(*data).rows(); i++){
            // cout<<i<<endl;
            xi = (*data)(i,0);
            yi = (*data)(i,1);

            fan+= (yi - log(an * xi)) * 1/an;
            fpan+= (- 1/an) * 1/an - (yi - log(an * xi)) * 1/(an*an);
        }
        an1=an-fan/fpan;

        printf("%lf  %lf\n",an,an1);
        if (fabs(an-an1) < 0.00000001)
            break;
        v.push_back(fabs(an-an1));
        an=an1;
        
    }
    printf("%d iterations\n",j);
    // exporting data fit:
    MatrixXd XiYi(600,2);
    for(int i=0; i<600; i++){
        XiYi(i,0) = (i+1)/10;                 // store the x value
        XiYi(i,1) = log(an * ((i+1)/10));       // store the y value
    }

    if (casename=="A"){
    write_vec("iterations_A.txt", v);
    write_matrix("A_fit.txt", XiYi);}
    else if (casename=="B"){
    write_vec("iterations_B.txt", v);
    write_matrix("B_fit.txt", XiYi);
    }
    else if (casename=="C"){
    write_vec("iterations_C.txt", v);
    write_matrix("C_fit.txt", XiYi);
    }
    return 0;
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
        // cout<<line<<endl;
        stringstream s(line);
        while (getline(s,row_item,' ')){
            // cout<<row_item<<" ";
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
            // cout<<rows[i][j]<<" ";
        }
    } 
    // cout<<"The following is a matrix of "<<nrows<<" rows and "<<ncols<<" coloumns: "<<endl<<*m<<endl;
    return m;
}

void write_matrix(string filename, MatrixXd m){
    ofstream(myfile);
    myfile.open(filename);
    for(int i=0; i<m.rows(); i++){
        for(int j=0; j<m.cols(); j++){
            myfile << m(i,j) <<",";
        }
        myfile << endl;
    }
}

void write_vec(string filename, vector<double> m){
    ofstream(myfile);
    myfile.open(filename);
    for(int i=0; i<m.end()-m.begin(); i++){
            myfile << m[i] <<endl;
        }
}