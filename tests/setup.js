import { MockLiveAPI } from "./mocks";

global.LiveAPI = MockLiveAPI;

beforeEach(() => MockLiveAPI.reset());
