export const state = () => ({
    userId: null
})

export const mutations = {
    setUserId(state, userId) {
        state.userId = userId
    }
}

export const actions = {
    setUserId({ commit }, userId) {
        commit('setUserId', userId)
    }
}

export const getters = {
    userId(state) {
        return state.userId
    },
}