/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.liferay.portlet.journal.model;

import com.liferay.portal.kernel.bean.AutoEscape;
import com.liferay.portal.model.BaseModel;
import com.liferay.portal.service.ServiceContext;

import com.liferay.portlet.expando.model.ExpandoBridge;

import java.io.Serializable;

/**
 * The base model interface for the JournalArticleImage service. Represents a row in the &quot;JournalArticleImage&quot; database table, with each column mapped to a property of this class.
 *
 * <p>
 * This interface and its corresponding implementation {@link com.liferay.portlet.journal.model.impl.JournalArticleImageModelImpl} exist only as a container for the default property accessors generated by ServiceBuilder. Helper methods and all application logic should be put in {@link com.liferay.portlet.journal.model.impl.JournalArticleImageImpl}.
 * </p>
 *
 * @author Brian Wing Shun Chan
 * @see JournalArticleImage
 * @see com.liferay.portlet.journal.model.impl.JournalArticleImageImpl
 * @see com.liferay.portlet.journal.model.impl.JournalArticleImageModelImpl
 * @generated
 */
public interface JournalArticleImageModel extends BaseModel<JournalArticleImage> {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this interface directly. All methods that expect a journal article image model instance should use the {@link JournalArticleImage} interface instead.
	 */

	/**
	 * Returns the primary key of this journal article image.
	 *
	 * @return the primary key of this journal article image
	 */
	public long getPrimaryKey();

	/**
	 * Sets the primary key of this journal article image.
	 *
	 * @param primaryKey the primary key of this journal article image
	 */
	public void setPrimaryKey(long primaryKey);

	/**
	 * Returns the article image ID of this journal article image.
	 *
	 * @return the article image ID of this journal article image
	 */
	public long getArticleImageId();

	/**
	 * Sets the article image ID of this journal article image.
	 *
	 * @param articleImageId the article image ID of this journal article image
	 */
	public void setArticleImageId(long articleImageId);

	/**
	 * Returns the group ID of this journal article image.
	 *
	 * @return the group ID of this journal article image
	 */
	public long getGroupId();

	/**
	 * Sets the group ID of this journal article image.
	 *
	 * @param groupId the group ID of this journal article image
	 */
	public void setGroupId(long groupId);

	/**
	 * Returns the article ID of this journal article image.
	 *
	 * @return the article ID of this journal article image
	 */
	@AutoEscape
	public String getArticleId();

	/**
	 * Sets the article ID of this journal article image.
	 *
	 * @param articleId the article ID of this journal article image
	 */
	public void setArticleId(String articleId);

	/**
	 * Returns the version of this journal article image.
	 *
	 * @return the version of this journal article image
	 */
	public double getVersion();

	/**
	 * Sets the version of this journal article image.
	 *
	 * @param version the version of this journal article image
	 */
	public void setVersion(double version);

	/**
	 * Returns the el instance ID of this journal article image.
	 *
	 * @return the el instance ID of this journal article image
	 */
	@AutoEscape
	public String getElInstanceId();

	/**
	 * Sets the el instance ID of this journal article image.
	 *
	 * @param elInstanceId the el instance ID of this journal article image
	 */
	public void setElInstanceId(String elInstanceId);

	/**
	 * Returns the el name of this journal article image.
	 *
	 * @return the el name of this journal article image
	 */
	@AutoEscape
	public String getElName();

	/**
	 * Sets the el name of this journal article image.
	 *
	 * @param elName the el name of this journal article image
	 */
	public void setElName(String elName);

	/**
	 * Returns the language ID of this journal article image.
	 *
	 * @return the language ID of this journal article image
	 */
	@AutoEscape
	public String getLanguageId();

	/**
	 * Sets the language ID of this journal article image.
	 *
	 * @param languageId the language ID of this journal article image
	 */
	public void setLanguageId(String languageId);

	/**
	 * Returns the temp image of this journal article image.
	 *
	 * @return the temp image of this journal article image
	 */
	public boolean getTempImage();

	/**
	 * Determines if this journal article image is temp image.
	 *
	 * @return <code>true</code> if this journal article image is temp image; <code>false</code> otherwise
	 */
	public boolean isTempImage();

	/**
	 * Sets whether this journal article image is temp image.
	 *
	 * @param tempImage the temp image of this journal article image
	 */
	public void setTempImage(boolean tempImage);

	public boolean isNew();

	public void setNew(boolean n);

	public boolean isCachedModel();

	public void setCachedModel(boolean cachedModel);

	public boolean isEscapedModel();

	public void setEscapedModel(boolean escapedModel);

	public Serializable getPrimaryKeyObj();

	public void setPrimaryKeyObj(Serializable primaryKeyObj);

	public ExpandoBridge getExpandoBridge();

	public void setExpandoBridgeAttributes(ServiceContext serviceContext);

	public Object clone();

	public int compareTo(JournalArticleImage journalArticleImage);

	public int hashCode();

	public JournalArticleImage toEscapedModel();

	public String toString();

	public String toXmlString();
}