using Ace;
using Ace.Application;
using Ace.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;
using Ace.IdStrategy;
using Chloe;
using Ace.Entity.System;

namespace Ace.Application
{
    public class AdminAppService<TEntity> : AdminAppService
    {
        IQuery<TEntity> _query;

        protected AdminAppService()
         : this(null, null)
        {
        }
        protected AdminAppService(IAppServiceFactory serviceFactory, IAceSession session)
            : base(serviceFactory, session)
        {
        }

        protected IQuery<TEntity> Query
        {
            get
            {
                if (this._query == null)
                    this._query = this.DbContext.Query<TEntity>();
                return this._query;
            }
        }

        protected TEntity InsertFromDto<Dto>(Dto dto)
        {
            if (dto is ValidationModel)
            {
                ValidationModel input = (ValidationModel)((object)dto);
                input.Validate();
            }

            return this.DbContext.InsertFromDto<TEntity, Dto>(dto);
        }
        protected int UpdateFromDto<Dto>(Dto dto)
        {
            if (dto is ValidationModel)
            {
                ValidationModel input = (ValidationModel)((object)dto);
                input.Validate();
            }

            return this.DbContext.UpdateFromDto<TEntity, Dto>(dto);
        }
        protected void Delete(object id)
        {
            id.NotNullOrEmpty();
            this.DbContext.DeleteByKey<TEntity>(id);
        }
        protected void SoftDelete(object id)
        {
            id.NotNullOrEmpty();
            this.DbContext.SoftDelete<TEntity>(id, this.Session.UserId);
        }
    }
    public class AdminAppService : SessionAppServiceBase<AdminSession>
    {
        protected AdminAppService()
            : this(null, null)
        {
        }
        protected AdminAppService(IAppServiceFactory serviceFactory, IAceSession session)
            : base(serviceFactory, session)
        {
        }

        public void Log(LogType logType, string moduleName, bool? result, string description)
        {
            Sys_Log log = this.CreateLog(logType, moduleName, result, description);
            this.DbContext.Insert(log);
        }
        public void Log(string userId, string realName, string ip, LogType logType, string moduleName, bool? result, string description)
        {
            Sys_Log log = this.CreateLog(userId, realName, ip, logType, moduleName, result, description);
            this.DbContext.Insert(log);
        }
        public Task LogAsync(LogType logType, string moduleName, bool? result, string description)
        {
            Sys_Log log = this.CreateLog(logType, moduleName, result, description);
            return this.DoAsync(dbContext =>
            {
                dbContext.Insert(log);
            });
        }
        public Task LogAsync(string userId, string realName, string ip, LogType logType, string moduleName, bool? result, string description)
        {
            Sys_Log log = this.CreateLog(userId, realName, ip, logType, moduleName, result, description);

            return this.DoAsync(dbContext =>
            {
                dbContext.Insert(log);
            });
        }

        /// <summary>
        /// 创建一个实体。
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="id">为 null 则使用 IdHelper.CreateSnowflakeId()</param>
        /// <returns></returns>
        protected T CreateEntity<T>(object id = null) where T : new()
        {
            T entity = new T();
            Type entityType = typeof(T);

            entity.SetPropertyValue("Id", id ?? IdHelper.CreateSnowflakeId().ToString());
            entity.SetPropertyValue("CreationTime", DateTime.Now);

            if (this.Session != null)
                entity.SetPropertyValue("CreateUserId", this.Session.UserId);

            PropertyInfo prop_IsDeleted = entityType.GetProperty("IsDeleted");
            if (prop_IsDeleted != null)
            {
                prop_IsDeleted.SetValue(entity, false);
            }

            return entity;
        }
        protected void SoftDelete<T>(object id)
        {
            id.NotNullOrEmpty();
            this.DbContext.SoftDelete<T>(id, this.Session.UserId);
        }

        Sys_Log CreateLog(LogType logType, string moduleName, bool? result, string description)
        {
            string userId = null;
            string userName = null;
            string ip = null;

            if (this.Session != null)
            {
                userId = this.Session.UserId;
                userName = this.Session.Name;
                ip = this.Session.LoginIP;
            }

            return this.CreateLog(userId, userName, ip, logType, moduleName, result, description);
        }
        Sys_Log CreateLog(string userId, string userName, string ip, LogType logType, string moduleName, bool? result, string description)
        {
            Sys_Log entity = new Sys_Log();

            entity.UserId = userId;
            entity.UserName = userName;
            entity.Type = logType;
            entity.ModuleName = moduleName;
            entity.IP = ip;
            entity.Result = result;
            entity.Description = description;

            entity.CreationTime = DateTime.Now;

            return entity;
        }
    }
}
