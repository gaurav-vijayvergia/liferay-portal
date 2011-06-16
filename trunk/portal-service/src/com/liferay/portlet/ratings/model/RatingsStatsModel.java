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

package com.liferay.portlet.ratings.model;

import com.liferay.portal.model.AttachedModel;
import com.liferay.portal.model.BaseModel;
import com.liferay.portal.service.ServiceContext;

import com.liferay.portlet.expando.model.ExpandoBridge;

import java.io.Serializable;

/**
 * The base model interface for the RatingsStats service. Represents a row in the &quot;RatingsStats&quot; database table, with each column mapped to a property of this class.
 *
 * <p>
 * This interface and its corresponding implementation {@link com.liferay.portlet.ratings.model.impl.RatingsStatsModelImpl} exist only as a container for the default property accessors generated by ServiceBuilder. Helper methods and all application logic should be put in {@link com.liferay.portlet.ratings.model.impl.RatingsStatsImpl}.
 * </p>
 *
 * @author Brian Wing Shun Chan
 * @see RatingsStats
 * @see com.liferay.portlet.ratings.model.impl.RatingsStatsImpl
 * @see com.liferay.portlet.ratings.model.impl.RatingsStatsModelImpl
 * @generated
 */
public interface RatingsStatsModel extends AttachedModel, BaseModel<RatingsStats> {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this interface directly. All methods that expect a ratings stats model instance should use the {@link RatingsStats} interface instead.
	 */

	/**
	 * Returns the primary key of this ratings stats.
	 *
	 * @return the primary key of this ratings stats
	 */
	public long getPrimaryKey();

	/**
	 * Sets the primary key of this ratings stats.
	 *
	 * @param primaryKey the primary key of this ratings stats
	 */
	public void setPrimaryKey(long primaryKey);

	/**
	 * Returns the stats ID of this ratings stats.
	 *
	 * @return the stats ID of this ratings stats
	 */
	public long getStatsId();

	/**
	 * Sets the stats ID of this ratings stats.
	 *
	 * @param statsId the stats ID of this ratings stats
	 */
	public void setStatsId(long statsId);

	/**
	 * Returns the fully qualified class name of this ratings stats.
	 *
	 * @return the fully qualified class name of this ratings stats
	 */
	public String getClassName();

	/**
	 * Returns the class name ID of this ratings stats.
	 *
	 * @return the class name ID of this ratings stats
	 */
	public long getClassNameId();

	/**
	 * Sets the class name ID of this ratings stats.
	 *
	 * @param classNameId the class name ID of this ratings stats
	 */
	public void setClassNameId(long classNameId);

	/**
	 * Returns the class p k of this ratings stats.
	 *
	 * @return the class p k of this ratings stats
	 */
	public long getClassPK();

	/**
	 * Sets the class p k of this ratings stats.
	 *
	 * @param classPK the class p k of this ratings stats
	 */
	public void setClassPK(long classPK);

	/**
	 * Returns the total entries of this ratings stats.
	 *
	 * @return the total entries of this ratings stats
	 */
	public int getTotalEntries();

	/**
	 * Sets the total entries of this ratings stats.
	 *
	 * @param totalEntries the total entries of this ratings stats
	 */
	public void setTotalEntries(int totalEntries);

	/**
	 * Returns the total score of this ratings stats.
	 *
	 * @return the total score of this ratings stats
	 */
	public double getTotalScore();

	/**
	 * Sets the total score of this ratings stats.
	 *
	 * @param totalScore the total score of this ratings stats
	 */
	public void setTotalScore(double totalScore);

	/**
	 * Returns the average score of this ratings stats.
	 *
	 * @return the average score of this ratings stats
	 */
	public double getAverageScore();

	/**
	 * Sets the average score of this ratings stats.
	 *
	 * @param averageScore the average score of this ratings stats
	 */
	public void setAverageScore(double averageScore);

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

	public int compareTo(RatingsStats ratingsStats);

	public int hashCode();

	public RatingsStats toEscapedModel();

	public String toString();

	public String toXmlString();
}