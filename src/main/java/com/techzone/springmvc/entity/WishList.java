package com.techzone.springmvc.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "wishlist")
public class WishList {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@ManyToOne(fetch = FetchType.EAGER , cascade = CascadeType.DETACH)
	@JoinColumn(name = "user" , nullable = false)
	private User user;
	
	@ManyToOne(fetch = FetchType.EAGER , cascade = CascadeType.DETACH)
	@JoinColumn(name = "product" , nullable = false)
	private Product product;
	
	@Column(name = "dateAdd" , nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dateAdd;
	
	public WishList() {
		
	}

	public WishList(User user, Product product, Date dateAdd) {
		super();
		this.user = user;
		this.product = product;
		this.dateAdd = dateAdd;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Date getDateAdd() {
		return dateAdd;
	}

	public void setDateAdd(Date dateAdd) {
		this.dateAdd = dateAdd;
	}

}
