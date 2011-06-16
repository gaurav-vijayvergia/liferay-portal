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

package com.liferay.portal.kernel.dao.orm;

/**
 * @author Brian Wing Shun Chan
 */
public interface CacheMode {

	public static final CacheMode GET = new CacheModeImpl("GET");

	public static final CacheMode IGNORE = new CacheModeImpl("IGNORE");

	public static final CacheMode NORMAL = new CacheModeImpl("NORMAL");

	public static final CacheMode PUT = new CacheModeImpl("PUT");

	public static final CacheMode REFRESH = new CacheModeImpl("REFRESH");

	public String getName();

}