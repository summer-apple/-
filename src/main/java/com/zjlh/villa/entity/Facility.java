package com.zjlh.villa.entity;

// Generated 2015-8-8 15:38:17 by Hibernate Tools 4.3.1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

/**
 * Facility generated by hbm2java
 */
@Entity
@Table(name = "Facility", catalog = "villa")
public class Facility implements java.io.Serializable {

	private Integer id;
	private String content;
	private Integer type;
	private String typeValue;
	
	public Facility() {
	}

	public Facility(String content, Integer type) {
		this.content = content;
		this.type = type;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "content", length = 45)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "type")
	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
	@Formula("(select d.value from Facility f join Dictionary d on f.type = d.code where d.key = 'facility_type' and f.id = id)")
	public String getTypeValue() {
		return typeValue;
	}

	public void setTypeValue(String typeValue) {
		this.typeValue = typeValue;
	}
}
