using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebAplication1.Model;
using WebAplication1.Services;

namespace WebAplication1.Controller
{
    public class ClaimController : ApiController
    {
        private IClaimService _claimService;
        public ClaimController(IClaimService claimService)
        {
            _claimService = claimService;
        }
        // GET: api/Claim
        public HttpResponseMessage Get()
        {
            IEnumerable<Claim> claims = _claimService.GetClaims();
            return Request.CreateResponse(HttpStatusCode.OK, claims);
        }

        // GET: api/Claim/5
        public HttpResponseMessage Get(int id)
        {
            try
            {
                Claim claimDetails = _claimService.ClaimDetails(id);
                return Request.CreateResponse(HttpStatusCode.OK, claimDetails);
            }
            catch(Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.ToString());
            }
        }

        // POST: api/Claim
        public HttpResponseMessage Post([FromBody]Claim NewClaim)
        {
            if(!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            try
            {
                _claimService.CreateClaim(NewClaim);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.ToString());
            }
            return Request.CreateResponse(HttpStatusCode.OK, "success");
        }

        // PUT: api/Claim/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Claim/5
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                _claimService.RemoveClaim(id);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.ToString());
            }
            return Request.CreateResponse(HttpStatusCode.OK, "success");
        }
    }
}
