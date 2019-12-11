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
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Claim
        public HttpResponseMessage Post([FromBody]Claim NewClaim)
        {
            _claimService.CreateClaim(NewClaim);
            if(!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
            return Request.CreateResponse(HttpStatusCode.OK, "success");
        }

        // PUT: api/Claim/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Claim/5
        public void Delete(int id)
        {
        }
    }
}
