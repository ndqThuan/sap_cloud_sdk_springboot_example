@import com.citek.sap.cloud.sdk.vdm.namespaces.rfqprocesssrv.RequestForQuotation
@import java.time.format.DateTimeFormatter 
@param RequestForQuotation rfq

<div
  class="flex flex-col h-full py-5 overflow-y-scroll bg-white border-l shadow-lg border-neutral-100/70"
>
  <div class="px-4 sm:px-5">
    <div class="flex items-start justify-between pb-1">
      <h2
        class="text-base font-semibold leading-6 text-gray-900"
        id="slide-over-title"
      >
        Request For Quotation
      </h2>
      <div class="flex items-center h-auto ml-3">
        <button
          @click="slideOverOpen=false"
          class="absolute top-0 right-0 z-30 flex items-center justify-center px-3 py-2 mt-4 mr-5 space-x-1 text-xs font-medium uppercase border rounded-md border-neutral-200 text-neutral-600 hover:bg-neutral-100"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
            class="w-4 h-4"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M6 18L18 6M6 6l12 12"
            ></path>
          </svg>
          <span>Close</span>
        </button>
      </div>
    </div>
  </div>
  <div class="relative flex-1 px-4 mt-5 sm:px-5">
    <div class="absolute inset-0 px-4 sm:px-5">
      <div
        class="relative h-full overflow-hidden border border-dashed rounded-md border-neutral-300"
      >
        <!-- Replace the fragment with this inner html -->
        <div class="bg-white shadow-md rounded-md p-4">
          <div
            class="flex justify-between mb-2"
            hx-trigger="intersect"
          >
            <h2 class="text-lg font-semibold">${rfq.getRFQ()}</h2>
            <button
              class="text-gray-600 hover:text-gray-900 transition duration-200"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-5 w-5"
                viewBox="0 0 20 20"
                fill="currentColor"
              >
                <path
                  d="M10 6a2 2 0 110-4 2 2 0 010 4zM10 12a2 2 0 110-4 2 2 0 010 4zM10 18a2 2 0 110-4 2 2 0 010 4z"
                />
              </svg>
            </button>
          </div>
          <h3 class="text-base font-medium mb-1">Description:</h3>
          <p class="text-gray-600 text-sm mb-4">
            ${rfq.getRFQDescription()}
          </p>
          <div class="flex flex-wrap justify-between mb-4">
            <div class="w-full md:w-1/2 xl:w-1/3 p-2">
              <h4 class="text-base font-medium mb-1">RFQ Status:</h4>
              <p class="text-gray-600 text-sm">${rfq.getStatus()}</p>
            </div>
            <div class="w-full md:w-1/2 xl:w-1/3 p-2">
              <h4 class="text-base font-medium mb-1">Created Date:</h4>
              <p class="text-gray-600 text-sm">
                @if(rfq.getQuotationStartDate() != null)
                  ${rfq.getQuotationStartDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))}
                @endif
              </p>
            </div>
            <div class="w-full md:w-1/2 xl:w-1/3 p-2">
              <h4 class="text-base font-medium mb-1">Deadline:</h4>
              <p class="text-gray-600 text-sm">
                ${rfq.getQuotationDeadline().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))}
              </p>
            </div>
          </div>
          <div class="flex justify-between">
            <button
              class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
            >
              View Details
            </button>
            <button
              class="bg-orange-500 hover:bg-orange-700 text-white font-bold py-2 px-4 rounded"
            >
              Edit RFQ
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
