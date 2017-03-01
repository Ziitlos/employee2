package com.model.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;


/**
 * Created by hkfq4 on 21.02.2017.
 */

@Entity
@Table(name = "EMP")
public class Emp implements java.io.Serializable {

    private Integer empno;
    private String ename;
    private Integer sal;
    private Date dob;

    public Emp(){

    }

    public Emp(String ename, Integer sal, Date dob){
        this.ename = ename;
        this.sal = sal;
        this.dob = dob;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "my_entity_seq_gen")
    @SequenceGenerator(name = "my_entity_seq_gen", sequenceName = "EMP_SEQUENCE")
    @Column(name = "empno", unique = true, nullable = false)
    public Integer getEmpno() {
        return empno;
    }

    public void setEmpno(Integer empno) {
        this.empno = empno;
    }

    @Column(name = "ename", length = 20)
    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    @Column(name = "sal")
    public Integer getSal() {
        return sal;
    }

    public void setSal(Integer sal) {
        this.sal = sal;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "dob", length = 10)
    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    //This method writes the values of contact object with System.out.println(Emp.toString()) code

    @Override
    public String toString(){
        return "Angestellter:"
                + "\n\t EmpNo: " + this.empno + " / "
                + "\n\t EmployeeName: " + this.ename + " / "
                + "\n\t Salary: " + this.sal + " / "
                + "\n\t Date of Birth: " + this.dob;
    }
}
