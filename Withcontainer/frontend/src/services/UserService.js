import axios from 'axios';

const USER_API_BASE_URL = "http://" + window.location.hostname + ":9080/api/v1/users";
//const USER_API_BASE_URL = "http://13.233.134.198:9080/api/v1/users";

console.log("API Base URL:", USER_API_BASE_URL);

class UserService {

    getUsers(){
        return axios.get(USER_API_BASE_URL);
    }

    createUser(user){
        return axios.post(USER_API_BASE_URL, user);
    }

    getUserById(userId){
        return axios.get(USER_API_BASE_URL + '/' + userId);
    }

    updateUser(user, userId){
        return axios.put(USER_API_BASE_URL + '/' + userId, user);
    }

    deleteUser(userId){
        return axios.delete(USER_API_BASE_URL + '/' + userId);
    }
}

export default new UserService()
