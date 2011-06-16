package ${packagePath}.service.base;

import com.liferay.portal.kernel.bean.BeanReference;
import com.liferay.portal.kernel.bean.IdentifiableBean;
import com.liferay.portal.kernel.bean.PortalBeanLocatorUtil;
import ${beanLocatorUtil};
import com.liferay.portal.kernel.dao.jdbc.SqlUpdate;
import com.liferay.portal.kernel.dao.jdbc.SqlUpdateFactoryUtil;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.search.Indexer;
import com.liferay.portal.kernel.search.IndexerRegistryUtil;
import com.liferay.portal.kernel.search.SearchException;
import com.liferay.portal.kernel.util.InfrastructureUtil;

import javax.sql.DataSource;

<#if sessionTypeName == "">
	import com.liferay.portal.service.base.PrincipalBean;
</#if>

<#if entity.hasColumns()>
	<#if entity.hasCompoundPK()>
		import ${packagePath}.service.persistence.${entity.name}PK;
	</#if>

	import ${packagePath}.model.${entity.name};
	import ${packagePath}.model.impl.${entity.name}Impl;

	import com.liferay.portal.kernel.dao.orm.DynamicQuery;
	import com.liferay.portal.kernel.exception.PortalException;
	import com.liferay.portal.kernel.util.OrderByComparator;

	import java.util.List;
</#if>

<#list referenceList as tempEntity>
	<#if tempEntity.hasLocalService()>
		import ${tempEntity.packagePath}.service.${tempEntity.name}LocalService;
	</#if>

	<#if tempEntity.hasRemoteService()>
		import ${tempEntity.packagePath}.service.${tempEntity.name}Service;
	</#if>

	<#if tempEntity.hasColumns() && (entity.name == "Counter" || tempEntity.name != "Counter")>
		import ${tempEntity.packagePath}.service.persistence.${tempEntity.name}Persistence;
		import ${tempEntity.packagePath}.service.persistence.${tempEntity.name}Util;
	</#if>

	<#if tempEntity.hasFinderClass() && (entity.name == "Counter" || tempEntity.name != "Counter")>
		import ${tempEntity.packagePath}.service.persistence.${tempEntity.name}Finder;
		import ${tempEntity.packagePath}.service.persistence.${tempEntity.name}FinderUtil;
	</#if>
</#list>

<#if sessionTypeName == "Local">
/**
 * The base implementation of the ${entity.humanName} local service.
 *
 * <p>
 * This implementation exists only as a container for the default service methods generated by ServiceBuilder. All custom service methods should be put in {@link ${packagePath}.service.impl.${entity.name}LocalServiceImpl}.
 * </p>
 *
 * @author ${author}
 * @see ${packagePath}.service.impl.${entity.name}LocalServiceImpl
 * @see ${packagePath}.service.${entity.name}LocalServiceUtil
 * @generated
 */
	public abstract class ${entity.name}LocalServiceBaseImpl implements ${entity.name}LocalService, IdentifiableBean {

		/*
		 * NOTE FOR DEVELOPERS:
		 *
		 * Never modify or reference this class directly. Always use {@link ${packagePath}.service.${entity.name}LocalServiceUtil} to access the ${entity.humanName} local service.
		 */
<#else>
/**
 * The base implementation of the ${entity.humanName} remote service.
 *
 * <p>
 * This implementation exists only as a container for the default service methods generated by ServiceBuilder. All custom service methods should be put in {@link ${packagePath}.service.impl.${entity.name}ServiceImpl}.
 * </p>
 *
 * @author ${author}
 * @see ${packagePath}.service.impl.${entity.name}ServiceImpl
 * @see ${packagePath}.service.${entity.name}ServiceUtil
 * @generated
 */
	public abstract class ${entity.name}ServiceBaseImpl extends PrincipalBean implements ${entity.name}Service, IdentifiableBean {

		/*
		 * NOTE FOR DEVELOPERS:
		 *
		 * Never modify or reference this class directly. Always use {@link ${packagePath}.service.${entity.name}ServiceUtil} to access the ${entity.humanName} remote service.
		 */
</#if>

	<#if sessionTypeName == "Local" && entity.hasColumns()>
		<#assign serviceBaseExceptions = serviceBuilder.getServiceBaseExceptions(methods, "add" + entity.name, [packagePath + ".model." + entity.name], ["SystemException"])>

		/**
		 * Adds the ${entity.humanName} to the database. Also notifies the appropriate model listeners.
		 *
		 * @param ${entity.varName} the ${entity.humanName}
		 * @return the ${entity.humanName} that was added
		<#list serviceBaseExceptions as exception>
		<#if exception == "SystemException">
		 * @throws SystemException if a system exception occurred
		<#else>
		 * @throws ${exception}
		</#if>
		</#list>
		 */
		public ${entity.name} add${entity.name}(${entity.name} ${entity.varName}) throws ${stringUtil.merge(serviceBaseExceptions)} {
			${entity.varName}.setNew(true);

			${entity.varName} = ${entity.varName}Persistence.update(${entity.varName}, false);

			Indexer indexer = IndexerRegistryUtil.getIndexer(getModelClassName());

			if (indexer != null) {
				try {
					indexer.reindex(${entity.varName});
				}
				catch (SearchException se) {
					if (_log.isWarnEnabled()) {
						_log.warn(se, se);
					}
				}
			}

			return ${entity.varName};
		}

		/**
		 * Creates a new ${entity.humanName} with the primary key. Does not add the ${entity.humanName} to the database.
		 *
		 * @param ${entity.PKVarName} the primary key for the new ${entity.humanName}
		 * @return the new ${entity.humanName}
		 */
		public ${entity.name} create${entity.name}(${entity.PKClassName} ${entity.PKVarName}) {
			return ${entity.varName}Persistence.create(${entity.PKVarName});
		}

		<#assign serviceBaseExceptions = serviceBuilder.getServiceBaseExceptions(methods, "delete" + entity.name, [entity.PKClassName], ["PortalException", "SystemException"])>

		/**
		 * Deletes the ${entity.humanName} with the primary key from the database. Also notifies the appropriate model listeners.
		 *
		 * @param ${entity.PKVarName} the primary key of the ${entity.humanName}
		<#list serviceBaseExceptions as exception>
		<#if exception == "PortalException">
		 * @throws PortalException if a ${entity.humanName} with the primary key could not be found
		<#elseif exception == "SystemException">
		 * @throws SystemException if a system exception occurred
		<#else>
		 * @throws ${exception}
		</#if>
		</#list>
		 */
		public void delete${entity.name}(${entity.PKClassName} ${entity.PKVarName}) throws ${stringUtil.merge(serviceBaseExceptions)} {
			${entity.name} ${entity.varName} = ${entity.varName}Persistence.remove(${entity.PKVarName});

			Indexer indexer = IndexerRegistryUtil.getIndexer(getModelClassName());

			if (indexer != null) {
				try {
					indexer.delete(${entity.varName});
				}
				catch (SearchException se) {
					if (_log.isWarnEnabled()) {
						_log.warn(se, se);
					}
				}
			}
		}

		<#assign serviceBaseExceptions = serviceBuilder.getServiceBaseExceptions(methods, "delete" + entity.name, [packagePath + ".model." + entity.name], ["SystemException"])>

		/**
		 * Deletes the ${entity.humanName} from the database. Also notifies the appropriate model listeners.
		 *
		 * @param ${entity.varName} the ${entity.humanName}
		<#list serviceBaseExceptions as exception>
		<#if exception == "SystemException">
		 * @throws SystemException if a system exception occurred
		<#else>
		 * @throws ${exception}
		</#if>
		</#list>
		 */
		public void delete${entity.name}(${entity.name} ${entity.varName}) throws ${stringUtil.merge(serviceBaseExceptions)} {
			${entity.varName}Persistence.remove(${entity.varName});

			Indexer indexer = IndexerRegistryUtil.getIndexer(getModelClassName());

			if (indexer != null) {
				try {
					indexer.delete(${entity.varName});
				}
				catch (SearchException se) {
					if (_log.isWarnEnabled()) {
						_log.warn(se, se);
					}
				}
			}
		}

		/**
		 * Performs a dynamic query on the database and returns the matching rows.
		 *
		 * @param dynamicQuery the dynamic query
		 * @return the matching rows
		 * @throws SystemException if a system exception occurred
		 */
		@SuppressWarnings("rawtypes")
		public List dynamicQuery(DynamicQuery dynamicQuery) throws SystemException {
			return ${entity.varName}Persistence.findWithDynamicQuery(dynamicQuery);
		}

		/**
		 * Performs a dynamic query on the database and returns a range of the matching rows.
		 *
		 * <p>
		 * <#include "range_comment.ftl">
		 * </p>
		 *
		 * @param dynamicQuery the dynamic query
		 * @param start the lower bound of the range of model instances
		 * @param end the upper bound of the range of model instances (not inclusive)
		 * @return the range of matching rows
		 * @throws SystemException if a system exception occurred
		 */
		@SuppressWarnings("rawtypes")
		public List dynamicQuery(DynamicQuery dynamicQuery, int start, int end) throws SystemException {
			return ${entity.varName}Persistence.findWithDynamicQuery(dynamicQuery, start, end);
		}

		/**
		 * Performs a dynamic query on the database and returns an ordered range of the matching rows.
		 *
		 * <p>
		 * <#include "range_comment.ftl">
		 * </p>
		 *
		 * @param dynamicQuery the dynamic query
		 * @param start the lower bound of the range of model instances
		 * @param end the upper bound of the range of model instances (not inclusive)
		 * @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
		 * @return the ordered range of matching rows
		 * @throws SystemException if a system exception occurred
		 */
		@SuppressWarnings("rawtypes")
		public List dynamicQuery(DynamicQuery dynamicQuery, int start, int end, OrderByComparator orderByComparator) throws SystemException {
			return ${entity.varName}Persistence.findWithDynamicQuery(dynamicQuery, start, end, orderByComparator);
		}

		/**
		 * Returns the number of rows that match the dynamic query.
		 *
		 * @param dynamicQuery the dynamic query
		 * @return the number of rows that match the dynamic query
		 * @throws SystemException if a system exception occurred
		 */
		public long dynamicQueryCount(DynamicQuery dynamicQuery) throws SystemException {
			return ${entity.varName}Persistence.countWithDynamicQuery(dynamicQuery);
		}

		<#assign serviceBaseExceptions = serviceBuilder.getServiceBaseExceptions(methods, "get" + entity.name, [entity.PKClassName], ["PortalException", "SystemException"])>

		/**
		 * Returns the ${entity.humanName} with the primary key.
		 *
		 * @param ${entity.PKVarName} the primary key of the ${entity.humanName}
		 * @return the ${entity.humanName}
		<#list serviceBaseExceptions as exception>
		<#if exception == "PortalException">
		 * @throws PortalException if a ${entity.humanName} with the primary key could not be found
		<#elseif exception == "SystemException">
		 * @throws SystemException if a system exception occurred
		<#else>
		 * @throws ${exception}
		</#if>
		</#list>
		 */
		public ${entity.name} get${entity.name}(${entity.PKClassName} ${entity.PKVarName}) throws ${stringUtil.merge(serviceBaseExceptions)} {
			return ${entity.varName}Persistence.findByPrimaryKey(${entity.PKVarName});
		}

		<#if entity.hasUuid() && entity.hasColumn("groupId")>
			/**
			 * Returns the ${entity.humanName} with the UUID in the group.
			 *
			 * @param uuid the UUID of ${entity.humanName}
			 * @param groupId the group id of the ${entity.humanName}
			 * @return the ${entity.humanName}
			<#list serviceBaseExceptions as exception>
			<#if exception == "PortalException">
			 * @throws PortalException if a ${entity.humanName} with the UUID in the group could not be found
			<#elseif exception == "SystemException">
			 * @throws SystemException if a system exception occurred
			<#else>
			 * @throws ${exception}
			</#if>
			</#list>
			 */
			public ${entity.name} get${entity.name}ByUuidAndGroupId(String uuid, long groupId) throws ${stringUtil.merge(serviceBaseExceptions)} {
				return ${entity.varName}Persistence.findByUUID_G(uuid, groupId);
			}
		</#if>

		/**
		 * Returns a range of all the ${entity.humanNames}.
		 *
		 * <p>
		 * <#include "range_comment.ftl">
		 * </p>
		 *
		 * @param start the lower bound of the range of ${entity.humanNames}
		 * @param end the upper bound of the range of ${entity.humanNames} (not inclusive)
		 * @return the range of ${entity.humanNames}
		 * @throws SystemException if a system exception occurred
		 */
		public List<${entity.name}> get${entity.names}(int start, int end) throws SystemException {
			return ${entity.varName}Persistence.findAll(start, end);
		}

		/**
		 * Returns the number of ${entity.humanNames}.
		 *
		 * @return the number of ${entity.humanNames}
		 * @throws SystemException if a system exception occurred
		 */
		public int get${entity.names}Count() throws SystemException {
			return ${entity.varName}Persistence.countAll();
		}

		<#assign serviceBaseExceptions = serviceBuilder.getServiceBaseExceptions(methods, "update" + entity.name, [packagePath + ".model." + entity.name], ["SystemException"])>

		/**
		 * Updates the ${entity.humanName} in the database. Also notifies the appropriate model listeners.
		 *
		 * @param ${entity.varName} the ${entity.humanName}
		 * @return the ${entity.humanName} that was updated
		<#list serviceBaseExceptions as exception>
		<#if exception == "SystemException">
		 * @throws SystemException if a system exception occurred
		<#else>
		 * @throws ${exception}
		</#if>
		</#list>
		 */
		public ${entity.name} update${entity.name}(${entity.name} ${entity.varName}) throws ${stringUtil.merge(serviceBaseExceptions)} {
			return update${entity.name}(${entity.varName}, true);
		}

		/**
		 * Updates the ${entity.humanName} in the database. Also notifies the appropriate model listeners.
		 *
		 * @param ${entity.varName} the ${entity.humanName}
		 * @param merge whether to merge the ${entity.humanName} with the current session. See {@link com.liferay.portal.service.persistence.BatchSession#update(com.liferay.portal.kernel.dao.orm.Session, com.liferay.portal.model.BaseModel, boolean)} for an explanation.
		 * @return the ${entity.humanName} that was updated
		<#list serviceBaseExceptions as exception>
		<#if exception == "SystemException">
		 * @throws SystemException if a system exception occurred
		<#else>
		 * @throws ${exception}
		</#if>
		</#list>
		 */
		public ${entity.name} update${entity.name}(${entity.name} ${entity.varName}, boolean merge) throws ${stringUtil.merge(serviceBaseExceptions)} {
			${entity.varName}.setNew(false);

			${entity.varName} = ${entity.varName}Persistence.update(${entity.varName}, merge);

			Indexer indexer = IndexerRegistryUtil.getIndexer(getModelClassName());

			if (indexer != null) {
				try {
					indexer.reindex(${entity.varName});
				}
				catch (SearchException se) {
					if (_log.isWarnEnabled()) {
						_log.warn(se, se);
					}
				}
			}

			return ${entity.varName};
		}
	</#if>

	<#list referenceList as tempEntity>
		<#if tempEntity.hasLocalService()>
			/**
			 * Returns the ${tempEntity.humanName} local service.
			 *
			 * @return the ${tempEntity.humanName} local service
			 */
			public ${tempEntity.name}LocalService get${tempEntity.name}LocalService() {
				return ${tempEntity.varName}LocalService;
			}

			/**
			 * Sets the ${tempEntity.humanName} local service.
			 *
			 * @param ${tempEntity.varName}LocalService the ${tempEntity.humanName} local service
			 */
			public void set${tempEntity.name}LocalService(${tempEntity.name}LocalService ${tempEntity.varName}LocalService) {
				this.${tempEntity.varName}LocalService = ${tempEntity.varName}LocalService;
			}
		</#if>

		<#if tempEntity.hasRemoteService()>
			/**
			 * Returns the ${tempEntity.humanName} remote service.
			 *
			 * @return the ${tempEntity.humanName} remote service
			 */
			public ${tempEntity.name}Service get${tempEntity.name}Service() {
				return ${tempEntity.varName}Service;
			}

			/**
			 * Sets the ${tempEntity.humanName} remote service.
			 *
			 * @param ${tempEntity.varName}Service the ${tempEntity.humanName} remote service
			 */
			public void set${tempEntity.name}Service(${tempEntity.name}Service ${tempEntity.varName}Service) {
				this.${tempEntity.varName}Service = ${tempEntity.varName}Service;
			}
		</#if>

		<#if tempEntity.hasColumns() && (entity.name == "Counter" || tempEntity.name != "Counter")>
			/**
			 * Returns the ${tempEntity.humanName} persistence.
			 *
			 * @return the ${tempEntity.humanName} persistence
			 */
			public ${tempEntity.name}Persistence get${tempEntity.name}Persistence() {
				return ${tempEntity.varName}Persistence;
			}

			/**
			 * Sets the ${tempEntity.humanName} persistence.
			 *
			 * @param ${tempEntity.varName}Persistence the ${tempEntity.humanName} persistence
			 */
			public void set${tempEntity.name}Persistence(${tempEntity.name}Persistence ${tempEntity.varName}Persistence) {
				this.${tempEntity.varName}Persistence = ${tempEntity.varName}Persistence;
			}
		</#if>

		<#if tempEntity.hasFinderClass() && (entity.name == "Counter" || tempEntity.name != "Counter")>
			/**
			 * Returns the ${tempEntity.humanName} finder.
			 *
			 * @return the ${tempEntity.humanName} finder
			 */
			public ${tempEntity.name}Finder get${tempEntity.name}Finder() {
				return ${tempEntity.varName}Finder;
			}

			/**
			 * Sets the ${tempEntity.humanName} finder.
			 *
			 * @param ${tempEntity.varName}Finder the ${tempEntity.humanName} finder
			 */
			public void set${tempEntity.name}Finder(${tempEntity.name}Finder ${tempEntity.varName}Finder) {
				this.${tempEntity.varName}Finder = ${tempEntity.varName}Finder;
			}
		</#if>
	</#list>

	/**
	 * Returns the Spring bean ID for this bean.
	 *
	 * @return the Spring bean ID for this bean
	 */
	public String getBeanIdentifier() {
		return _beanIdentifier;
	}

	/**
	 * Sets the Spring bean ID for this bean.
	 *
	 * @param beanIdentifier the Spring bean ID for this bean
	 */
	public void setBeanIdentifier(String beanIdentifier) {
		_beanIdentifier = beanIdentifier;
	}

	<#if entity.hasColumns()>
		protected Class<?> getModelClass() {
			return ${entity.name}.class;
		}

		protected String getModelClassName() {
			return ${entity.name}.class.getName();
		}
	</#if>

	/**
	 * Performs an SQL query.
	 *
	 * @param sql the sql query
	 */
	protected void runSQL(String sql) throws SystemException {
		try {
			<#if entity.hasColumns()>
				DataSource dataSource = ${entity.varName}Persistence.getDataSource();
			<#else>
				DataSource dataSource = InfrastructureUtil.getDataSource();
			</#if>

			SqlUpdate sqlUpdate = SqlUpdateFactoryUtil.getSqlUpdate(dataSource, sql, new int[0]);

			sqlUpdate.update();
		}
		catch (Exception e) {
			throw new SystemException(e);
		}
	}

	<#list referenceList as tempEntity>
		<#if tempEntity.hasLocalService()>
			@BeanReference(type = ${tempEntity.name}LocalService.class)
			protected ${tempEntity.name}LocalService ${tempEntity.varName}LocalService;
		</#if>

		<#if tempEntity.hasRemoteService()>
			@BeanReference(type = ${tempEntity.name}Service.class)
			protected ${tempEntity.name}Service ${tempEntity.varName}Service;
		</#if>

		<#if tempEntity.hasColumns() && (entity.name == "Counter" || tempEntity.name != "Counter")>
			@BeanReference(type = ${tempEntity.name}Persistence.class)
			protected ${tempEntity.name}Persistence ${tempEntity.varName}Persistence;
		</#if>

		<#if tempEntity.hasFinderClass() && (entity.name == "Counter" || tempEntity.name != "Counter")>
			@BeanReference(type = ${tempEntity.name}Finder.class)
			protected ${tempEntity.name}Finder ${tempEntity.varName}Finder;
		</#if>
	</#list>

	<#if (sessionTypeName == "Local") && entity.hasColumns()>
		private static Log _log = LogFactoryUtil.getLog(${entity.name}${sessionTypeName}ServiceBaseImpl.class);
	</#if>

	private String _beanIdentifier;

}