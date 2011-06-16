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

package com.liferay.portal.kernel.metadata;

import com.liferay.portlet.dynamicdatamapping.storage.Fields;

import java.io.InputStream;

import java.util.Map;

/**
 * @author Miguel Pastor
 */
public class RawMetadataProcessorUtil {

	public static Map<String, Fields> getRawMetadataMap(
		InputStream inputStream) {

		return getRawMetadataProcessor().getRawMetadataMap(inputStream);
	}

	public static RawMetadataProcessor getRawMetadataProcessor() {
		return _rawMetadataProcessor;
	}

	public void setRawMetadataProcessor(
		RawMetadataProcessor rawMetadataProcessor) {

		_rawMetadataProcessor = rawMetadataProcessor;
	}

	private static RawMetadataProcessor _rawMetadataProcessor;

}